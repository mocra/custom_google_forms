# Use 'Ruby Machinst.tmbundle' Cmd+B to generate blueprints from class names
require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  name              { Faker::Name.name }
  first_name        { Faker::Name.first_name }
  last_name         { Faker::Name.last_name }
  company_name      { Faker::Company.name }
  login             { Faker::Internet.user_name.gsub(/W/, '')[0..14] } # max 15 chars
  message           { Faker::Lorem.sentence }
  description       { Faker::Lorem.sentence }
  email             { Faker::Internet.email }
end
  
Dir[File.join(File.dirname(__FILE__), 'blueprints', '*_blueprint.rb')].each {|bp| require bp}
