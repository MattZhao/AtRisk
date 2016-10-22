Feature: create new form
  As a guardian of an at risk person
  In order to report at risk person information
  I want to create forms
  
Background:
  Given I am logged in

Scenario: navigate to create form
  Given I am on the user dashboard page
  When I follow "New At-Risk Form"
  Then I should be on the new form page

Scenario: create new form
  Given I am on the new form page
  When I fill in "Individuals Name" with "Matthew"
  And I press "Submit Form"
  Then I should see "Successfully Created Form for Matthew"
  When I am on the new form page
  When I am on the user dashboard page
  And I should find that form table contains "Matthew"
