Feature: create new form
    As a guardian of an at risk person
    In order to report at risk person information
    I want to create forms

Scenario: navigate to create form
    Given I am on the user dashboard
    And a “create” button exists
    When I press on the “create” button
    I should be on the “create form” page

Scenario: create new form
    Given I am on the “create form” page
    Then I fill out name “Matthew”
    And D-O-B “01-17-1994”
    When I press the “submit” button
    Then I should see “Matthew”
    And I should see “01-17-1994”