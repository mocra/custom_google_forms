Feature: Filling in form
  In order to receive form submissions and store in Google Forms
  As a user
  I want to filling a customized Google Form

  Scenario: Fill in a Google Form without errors
    Given I have a Google Form with slug "railsdev"
    And I expect Google Form POST to be successful
    And I am on "/railsdev"
    Then I should see no "style" attributes
    And I should see no "ss-legal" classes
    And I should see no "style" elements
    And I should see 1 "link" element
    And I should not see "Google Docs"
    When I fill in "Text Question" with "My Answer"
    And I press "Submit"
    Then I should see "Thanks for your answers."
  
  Scenario: Fill in a Google Form with errors
    Given I have a Google Form with slug "railsdev"
    And I expect Google Form POST to have errors
    And I am on "/railsdev"
    And I should see no "style" attributes
    And I should see no "ss-legal" classes
    Then I should see no "style" elements
    Then I should see 1 "link" element
    And I press "Submit"
    Then I should not see "Thanks for your answers."
    And I should see "Looks like you have a question or two that still needs to be filled out."
    And I expect Google Form POST to be successful
    When I fill in "Text Question" with "My Answer"
    And I press "Submit"
    Then I should see "Thanks for your answers."
