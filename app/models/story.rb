class Story
  include DataMapper::Resource
  
  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :started_at, DateTime
  property :finished_at, DateTime
  property :current, Boolean
  property :title, String
  property :content, Text
  property :character_at, Integer
  property :sort_order, Integer, :key => true

end