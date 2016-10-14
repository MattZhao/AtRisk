Feature: Edit form
    As a user who has some historical data on the app
    In order to make some changes to the data
    I want to update one of my records

  Background:
    Given I am logged in as "MattZhao"
    And the following form exist:
    | name | type | uid |
    | Matthew | Autism | MattZhao|

  Scenario: The user should be able to access the edit page
    Given I am on the user dashboard page
    When I press "Matthew"
    And I press "Edit Form"
    Then I should be on the Edit Form page
    
  Scenario: The user should be able to edit form
    Given I am on the user dashboard page
    When I press "Matthew"
    And I press "Edit Form"
    And I fill in "name" with "Banana"
    And I press "submit"
    Then I should see "Banana"
    But I should not see "Matthew"
  
  Scenario: The user should be able to cancel edit
    Given I am on the user dashboard page
    When I press "Matthew"
    And I press "Edit Form"
    And I fill in "name" with "Banana"
    And I press "cancel"
    Then I should see "Matthew"
    But I should not see "Banana"
    