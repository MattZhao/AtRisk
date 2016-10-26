Feature: Edit User
  As a registered user of the website
  I want to edit my user profile especially phone number
  so I can change my username

    Scenario: I sign in and edit my phone number
      Given I am logged in
      When I edit my email address
      And I save the edit form
      Then I should see an account edited message
      