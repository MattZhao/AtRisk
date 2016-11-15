Feature: Edit form
    As a user who has some historical data on the app
    In order to make some changes to the data
    I want to update one of my records

  Background:
    Given I am logged in
    And the following autism forms exist:
    | name | form_type | id_user | address |
    | Matthew | Autism | 1 | Telegraph Ave |

  Scenario: The user should be able to access the edit page
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit page for "Matthew"
    And I check "form_terms_of_service"
    And I press "Update Form"
    Then the form_type of "Matthew" should be "Autism"
    And the address of "Matthew" should be "Telegraph Ave"

    
  Scenario: The user should be able to edit form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the form_type of "Matthew" should be "Autism"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit page for "Matthew"
    And I fill in "Address" with "Shattuck Ave"
    And I check "form_terms_of_service"
    And I press "Update Form"
    And the address of "Matthew" should be "Shattuck Ave"

  
  Scenario: The user should be able to cancel edit
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the form_type of "Matthew" should be "Autism"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit page for "Matthew"
    And I fill in "Address" with "Shattuck Ave"
    And I follow "Cancel"
    And the address of "Matthew" should be "Telegraph Ave"
    But the address of "Matthew" should not be "Shattuck Ave"