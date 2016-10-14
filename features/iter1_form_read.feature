Feature: create new form
    As a guardian of at risk people
    In order to track their info
    I want to view the forms that I submitted before

Background: forms have been added to database
    Given the following form exist:
    | name | D-O-B |
    | Matthew | 01-17-1994|
    
Scenario: view submitted form
    Given I am on the user dashboard
    Then I should see "Matthew"
    And I should see "01-17-1994"
    