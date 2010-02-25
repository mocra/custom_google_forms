
# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml', :version => '>= 2.0.0'
  config.gem 'formtastic', :version => '>= 0.9.7'
  config.gem 'inherited_resources', :version => '1.0.3'
  config.gem 'nokogiri'
  
  config.middleware.use "Rails::Rack::Static"

  config.time_zone = 'UTC'
end