Feature: Edit form
    As a user who has some historical data on the app
    In order to make some changes to the data
    I want to update one of my records

Background: forms have been added to database
    Given the following form exist:
    | name | D-O-B | address |
    | Carl M. Spence| 01-01-1930| 1234 Telegraph Ave|

Scenario: The user can be navigated to the detail page
    Given I am on the user dashboard
    Then I should see "Carl M. Spence"
    And I should see "01-01-1930"
    And a “edit” button exists
    When I press on the “edit” button
    Then I should be on the “form detail” page for "Carl M. Spence"

Scenario: The user can cancel submitting data on the edit page
    Given I am on the “form detail” page for "Carl M. Spence"
    Then I should see "Carl M. Spence"
    And I should see "01-01-1930"
    And I should see " 1234 Telegraph Ave"
    And a “edit” button exists
    When I press on the “edit” button
    And a “update” button exists
    And a “cancel” button exists
    Then I fill out address “4321 Shattuck Ave”
    When I press the “cancel” button
    Then I should be on the “form detail” page
    And the address of "Carl M. Spence" should be "1234 Telegraph Ave"
    And I should not see " 4321 Shattuck Ave"


Scenario: The user can submit data on the edit form page
    Given I am on the “form detail” page for "Carl M. Spence"
    Then I should see "Carl M. Spence"
    And I should see "01-01-1930"
    And I should see " 1234 Telegraph Ave"
    And a “edit” button exists
    When I press on the “edit” button
    And a “update” button exists
    And a “cancel” button exists
    Then I fill out address “4321 Shattuck Ave”
    When I press the “update” button
    Then I should be on the “form detail” page
    And I should see “Carl M. Spence”
    And the address of "Carl M. Spence" should be "4321 Shattuck Ave"
    And I should not see " 1234 Telegraph Ave"
