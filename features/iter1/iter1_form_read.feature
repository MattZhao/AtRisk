Feature: create new form
  As a guardian of at risk people
  In order to track their info
  I want to view the forms that I submitted before

  Background:
    # create Carrot as user_two
    # create Matthew, Banana as user
    Given I am loggedin as user_two
    Given I am on the new form page
    When I fill in "Individuals Name" with "Carrot"
    When I fill in "Eye Color" with "Purple"
    And I press "Submit Form"
    Then I should see "Successfully Created Form for Carrot"
    Then I sign out
    
    Given I am logged in
    Given I am on the new form page
    When I fill in "Individuals Name" with "Matthew"
    When I fill in "Eye Color" with "Brown"
    And I press "Submit Form"
    Then I should see "Successfully Created Form for Matthew"
    And I should find that form table contains "Matthew"
    
    Given I am on the new form page
    When I fill in "Individuals Name" with "Banana"
    When I fill in "Eye Color" with "Red"
    And I press "Submit Form"
    Then I should see "Successfully Created Form for Banana"
    And I should find that form table contains "Banana"

  # signed in as user, so can only see Matthew and Banana
  Scenario: view submitted form on Dashboard
    Given I am on the user dashboard page
    Then I should find that form table contains "Matthew"
    But I should find that form table contains "Banana"
    And I should not find that form table contains "Carrot"
    
  # cannot see info on Banana on detailed form of Matthew
  Scenario: view the detailed form
    Given I am on the user dashboard page
    Then I should see "Matthew"
    When I follow "Matthew"
    And I should not see "Banana"
    