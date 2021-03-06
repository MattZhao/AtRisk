Feature: Visit the landing page
  As a common user
  In order to see what I can do with this website
  I should be able to see the home page of the website
  
  Scenario: Successfully see the homepage
    Given I am not logged in
    And I am on the home page
    Then I should see "Log In"
    And I should see "Sign Up"
    
  Scenario: Logged in users should be redirected to dashboard
    Given I am logged in
    When I go to the home page
    Then I should be on the user dashboard page