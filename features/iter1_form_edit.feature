Feature: Edit form
    As a user who has some historical data on the app
    In order to make some changes to the data
    I want to update one of my records

Background: forms have been added to database
    Given the following form exist:
    | name | D-O-B | address |
    | Carl M. Spence| 01-01-1930| 1234 Telegraph Ave|

Scenario: The user can be navigated to the edit page
    Given I am on the user dashboard
    Then I should see "Carl M. Spence"
    And I should see "01-01-1930"
    And a “edit” button exists
    When I press on the “edit” button
    Then I should be on the “edit form” page

Scenario: The user can cancel submitting data on the edit page
    Given I am on the “edit form” page for "Carl M. Spence"
    Then I should see "Carl M. Spence"
    And I should see "01-01-1930"
    And I should see " 1234 Telegraph Ave"
    And a “submit” button exists
    And a “cancel” button exists
    Then I fill out address “4321 Shattuck Ave”
    When I press the “cancel” button
    Then I should be on the “edit form” page
    And I should see “Carl M. Spence”
    And I should see “1234 Telegraph Ave”

Scenario: The user can submit data on the “edit form” page
    Given I am on the “edit form” page for "Carl M. Spence"
    Then I should see "Carl M. Spence"
    And I should see "01-01-1930"
    And I should see " 1234 Telegraph Ave"
    And a “submit” button exists
    And a “cancel” button exists
    Then I fill out address “4321 Shattuck Ave”
    When I press the “submit” button
    Then I should be on the “edit form” page
    And I should see “Carl M. Spence”
    And I should see “4321 Shattuck Ave”
    