Feature: log in and see the dashboard
  As a user 
  In order to be manage my form 
  I want to  see my dashboard

  Scenario: Successfully see dashboard
    Given I am on the user dashboard page
    And I am logged in as "MattZhao"
    Then I should see "My Forms"
    And I should see "New At-Risk Form"
    And I should see "New Autism Alert Form"
    