Feature: log in and see the dashboard
    As a user I should be able to log in with an account and see the dashboard

Background:
    Given the app is set up
    And I am not logged into the dashboard
    And I am on the homepage

Scenario: Successfully log in and see dashboard
    Given I have an account
    When I fill in "User Name" with "Matthew Zhao"
    And I fill in "Password" with "233"
    And I press "Log In"
    Then I should see the dashboard
    Then I should see "My Forms"
    Then I should see "New At-Risk Form"
    Then I should see "New Autism Alert Form"
    Then I should see "Log Out"
    Then I should see "Please call us at (123)456-7890"