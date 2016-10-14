Feature: Delete form
  As a guardian of an at risk person
  In order to keep this database up-to-date
  I want to delete one of my records

  Background:
    Given I am logged in as "MattZhao"
    And the following form exist:
    | name | type | uid |
    | Matthew | Autism | MattZhao|

  Scenario: Delete form
    Given I am on the user dashboard page
    When I press "Matthew"
    And I press "Delete Form"
    Then I should see "Your form is deleted"
    But I should not see "Matthew"
    