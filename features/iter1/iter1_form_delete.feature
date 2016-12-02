Feature: Delete form
  As a guardian of an at risk person
  In order to keep this database up-to-date
  I want to delete one of my records

  Background:
    Given I am logged in

  Scenario: Delete form
    Given I am on the user dashboard page
    When I follow "New Autism Alert Form"
    When I fill in "Individuals Name" with "Matthew"
    And I check "form_terms_of_service"
    And I press "Submit Form"
    Then I should see "Successfully Created Form for Matthew"
    And I should find that form table contains "Matthew"
    Given I am on the user dashboard page
    When I go to the info page for "Matthew"
    And I follow "Delete Form"
    Then I should see "Form for Matthew is deleted"
    And I am on the user dashboard page
    And I should not find that form table contains "Matthew"
