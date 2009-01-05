class AppConfig
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :config_key, String
  property :config_value, Text, :nullable => true
end