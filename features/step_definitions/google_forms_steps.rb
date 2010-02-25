Given /^I have a Google Form with slug "([^\"]*)"$/ do |slug|
  steps <<-CUCUMBER
    Given I expect Google Form "dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA" to be fetched
    Given I am on the new forms page
    When I fill in "Slug" with "#{slug}"
    And I fill in "Form Key" with "dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA"
    And I press "Create"
    Then I should see "Your form 'Sample form for Testing' has been successfully customized."
  CUCUMBER
  
end

Given /^I expect Google Form "([^\"]*)" to be fetched$/ do |formkey|
  sample_form = File.read(File.join(Rails.root, "features", "fixtures", "sample_form.html"))
  FakeWeb.register_uri(:get, "http://spreadsheets.google.com/viewform?formkey=#{formkey}", :body => sample_form)
end

Given /^I expect Google Form "([^\"]*)" to be invalid$/ do |formkey|
  FakeWeb.register_uri(:get, "http://spreadsheets.google.com/viewform?formkey=#{formkey}", :body => "Go away!", :status => [404, "Not Found"])
end

Given /^I expect Google Form POST to be successful/ do
  thankyou = File.read(File.join(Rails.root, "features", "fixtures", "sample_form_thanks.html"))
  FakeWeb.register_uri(:post, "http://spreadsheets.google.com/formResponse?formkey=dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA&ifq", :body => thankyou)
end

Given /^I expect Google Form POST to have errors/ do
  thankyou = File.read(File.join(Rails.root, "features", "fixtures", "sample_form_with_errors.html"))
  FakeWeb.register_uri(:post, "http://spreadsheets.google.com/formResponse?formkey=dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA&ifq", :body => thankyou)
end