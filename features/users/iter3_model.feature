Feature: Sign up
  In order to manage my users
  As admin
  I want to be able to view user info and do management stuff

    Background:
      Given I am not logged in

    Scenario: User signs up with mandatory data
      When I sign up with mandatory user data
      Then I should see a successful sign up message
      