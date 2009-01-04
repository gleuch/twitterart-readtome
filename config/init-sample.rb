# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml

Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '46484773c352309deea9388f3f1f12e81b08c8da'  # required for cookie session store
  c[:session_id_key] = '_./_session_id' # cookie session id key, defaults to "_session_id"

  # Configure the user names for the TwitterArt sections. 
  # To disable a section of the app, just comment out the line or make the username blank.
  c[:twitter_names] = {
    :readtome => {:user => 'readtome', :password => ''}
  }

  c[:cron_key] = 'e3krkemn023lpm3op0newk93232'
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
  DataMapper.auto_upgrade!
end