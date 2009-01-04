class Vote
  include DataMapper::Resource
  
  property :id, Serial
  property :created_at, DateTime
  property :story_id, Integer
  property :direction, Integer

  belongs_to :stories
end