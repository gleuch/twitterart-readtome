class Story
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :started_at, DateTime, :nullable => true
  property :finished_at, DateTime, :nullable => true
  property :current, Boolean, :default => 0, :nullable => false
  property :title, String
  property :content, Text
  property :character_at, Integer, :default => 0, :nullable => false
  property :votes_up, Integer, :default => 0, :nullable => false
  property :votes_down, Integer, :default => 0, :nullable => false

  has n, :votes
end