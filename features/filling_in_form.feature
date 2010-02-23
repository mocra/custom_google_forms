Feature: Filling in form
  In order to receive form submissions and store in Google Forms
  As a user
  I want to filling a customized Google Form

  Scenario: Fill in a Google Form without errors
    Given I have a Google Form with slug "railsdev"
    And I am on "/railsdev"
    When I fill in "Text Question" with "My Answer"
    And I press "Submit"
    Then I should see "Thanks for your answers."
  
  
  
