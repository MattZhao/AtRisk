Feature: create new form
  As a guardian of an at risk person
  In order to report at risk person information
  I want to create forms
  
  Background:
    Given I am logged in as "MattZhao"

  Scenario: navigate to create form
    Given I am on the user dashboard page
    When I press "New At-Risk Form"
    Then I should be on the New AtRisk form page

  Scenario: create new form
    Given I am on the New AtRisk form page
    When I fill in "name" with “Matthew”
    And I press "submit"
    Then I should see “Your form is submitted”
    And I should see "Matthew"
    