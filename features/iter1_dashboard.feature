Feature: log in and see the dashboard
  As a user
  In order to be manage my form 
  I want to  see my dashboard

  Background:
    Given I am logged in as "MattZhao"
    
  Scenario: Successfully see dashboard
    Given I am on the user dashboard page
    Then I should see "My Forms"
    And I should see "New At-Risk Form"
    And I should see "New Autism Alert Form"
    