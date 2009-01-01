class Stories < Application
  # provides :xml, :yaml, :js
  before :ensure_authenticated, :exclude => [:index, :show]

  def index
    @stories = Story.all
    display @stories
  end

  def show(id)
    @story = Story.get(id)
    raise NotFound unless @story
    display @story
  end

  def new
    only_provides :html
    @story = Story.new
    display @story
  end

  def edit(id)
    only_provides :html
    @story = Story.get(id)
    raise NotFound unless @story
    display @story
  end

  def create(story)
    @story = Story.new(story)
    if @story.save
      redirect resource(@story), :message => {:notice => "Story was successfully created"}
    else
      message[:error] = "Story failed to be created"
      render :new
    end
  end

  def update(id, story)
    @story = Story.get(id)
    raise NotFound unless @story
    if @story.update_attributes(story)
       redirect resource(@story)
    else
      display @story, :edit
    end
  end

  def destroy(id)
    @story = Story.get(id)
    raise NotFound unless @story
    if @story.destroy
      redirect resource(:stories)
    else
      raise InternalServerError
    end
  end

  def publish
    @story = Story.all(:current => 1, :order => [:started_at.desc]).first()

    snip = @story.content.gsub(/\n/, " ").gsub(/( ){2,}/, " ")[@story.character_at.to_i..(@story.character_at.to_i + 141)].lstrip
    adjust = 0

    # Clean out left whitespace
    if snip.size == 142
      snip = snip.chop
      adjust = 1
    end  

    # Check if tweet is breaking last word, otherwise stop before word
    if snip[-1..-1] == ' '
      @tweet = snip.rstrip
    else
      tweet = []
      snip.split(" ").each do |r|
        if (tweet.join(" ").size + r.size + 1) <= 140
          tweet << r
        end
      end
      @tweet = tweet.join(" ")
    end

    if Twitter::Base.new(TWITTER_NAMES[:readtome][:user], TWITTER_NAMES[:readtome][:password]).update(@tweet, {:source => 'twitterart'})
      @story.update_attributes({:character_at => (@tweet.size + adjust + @story.character_at)})
    end

    display @story
  end

end # Stories
