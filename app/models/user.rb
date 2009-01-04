# This is a default user class used to activate merb-auth.  Feel free to change from a User to 
# Some other class, or to remove it altogether.  If removed, merb-auth may not work by default.
#
# Don't forget that by default the salted_user mixin is used from merb-more
# You'll need to setup your db as per the salted_user mixin, and you'll need
# To use :password, and :password_confirmation when creating a user
#
# see merb/merb-auth/setup.rb to see how to disable the salted_user mixin
# 
# You will need to setup your database and create a user.
class User
  include DataMapper::Resource
  
  property :id, Serial
  property :login, String
  property :id, Serial
  property :login, String, :nullable => false, :unique => true, :length => (3..40),
    :messages => {
      :presence => "We need your email address.",
      :is_unique => "We already have that login."
    }
  property :email, String, :nullable => false, :unique => true, :format => :email_address,
    :messages => {
      :presence => "We need your email address.",
      :is_unique => "We already have that email.",
      :format => "Doesn't look like an email to me..."
    }
  property :name, String
  property :admin, Boolean
end