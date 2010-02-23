require "email_spec/cucumber"
require File.dirname(__FILE__) + "/../../spec/blueprints"

Before do
  FakeWeb.allow_net_connect = false
end
