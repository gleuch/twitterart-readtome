class Story
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :started_at, DateTime, :nullable => true
  property :finished_at, DateTime, :nullable => true
  property :current, Boolean, :default => 0, :nullable => false
  property :title, String
  property :author, String
  property :content, Text
  property :character_at, Integer, :default => 0, :nullable => false
  property :tweet, Text, :nullable => true
  property :votes_up, Integer, :default => 0, :nullable => false
  property :votes_down, Integer, :default => 0, :nullable => false

  has n, :votes

  def story_type?
    if (current)
      "current"
    elsif (!current && started_at.blank? && finished_at.blank?)
      "upcoming"
    else
      "previous"
    end
  end

  def story_link
    type = self.story_type?
    if (type == "current")
      "/stories/currently-reading"
    elsif(type == "upcoming")
      "/stories/upcoming-reads/#{id}"
    else
      "/stories/previously-read/#{id}"
    end
  end
end