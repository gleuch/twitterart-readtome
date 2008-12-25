class Story
  include DataMapper::Resource
  
  property :id, Serial

  property :title, String
  property :content, Text

end
