Feature: Delete form
    As a guardian of an at risk person
    In order to keep this database up-to-date
    I want to delete one of my records

Given the following form exist:
    | name | D-O-B | address |
    | Bobby B.| 01-01-1930| 1234 Happy St.|

Scenario: Delete form
    Given I am on the user dashboard
    And my record "Bobby B." exists
    When I follow "Bobby B."
    Then I should see "1234 Happy St."
    And I should see "Delete Form"
    When I press "Delete Form"
    Then I should see "Record was successfully deleted."
    And I should be on the user dashboard
    And I should not see "Bobby B."