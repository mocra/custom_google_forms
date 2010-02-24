Feature: Add new google forms
  In order to allow custom themed google forms to be filled in
  As an admin
  I want to specify new google forms to wrap

  Scenario: Add a new google form by full url
    Given I expect Google Form "dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA" to be fetched
    And I am on the new forms page
    When I fill in "Slug" with "railsdev"
    And I fill in "Form Key" with "http://spreadsheets.google.com/viewform?formkey=dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA"
    And I press "Create"
    Then I should see "You can view the published form here:"
  
  Scenario: Add a new google form by form key
    Given I expect Google Form "dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA" to be fetched
    And I am on the new forms page
    When I fill in "Slug" with "railsdev"
    And I fill in "Form Key" with "dFRUNHpLZmZHbVRrdlpMRnlJclBLc0E6MA"
    And I press "Create"
    Then I should see "You can view the published form here:"
  
  Scenario: Fail to add a new google form because of an invalid form key
    Given I expect Google Form "XXXX" to be invalid
    And I am on the new forms page
    When I fill in "Slug" with "railsdev"
    And I fill in "Form Key" with "XXXX"
    And I press "Create"
    Then I should see "is not a valid Google Forms key or URL"
  
  
  
  
