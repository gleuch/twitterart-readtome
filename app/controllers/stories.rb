class Stories < Application
  # provides :xml, :yaml, :js
  before :ensure_authenticated, :exclude => [:index, :show]

  def index
    @stories = {}
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

  def vote(id)
    
  end


  def publish
    @story = Story.all(:current => 1, :order => [:started_at.desc]).first()

    @tweet, tweet_size = make_tweet(@story)

    #if Twitter::Base.new(TWITTER_NAMES[:readtome][:user], TWITTER_NAMES[:readtome][:password]).update(@tweet, {:source => 'twitterart'})
    #  @story.update_attributes({:character_at => (tweet_size + @story.character_at)})
    #end

    display @story
  end

end # Stories
