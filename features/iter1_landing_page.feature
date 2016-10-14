Feature: visit the landing page
    As a user I should be able to see the home page of the website

Background:
    Given the app is set up
    And I am not logged into the dashboard

Scenario: Successfully see the homepage
    When I go to the home page
    Then I should see "At Risk"
    And I should see "Log In"
    And I should see "Register"