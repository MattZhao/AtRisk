Feature: view and add to FAQ page
  As a user who has logged in
  I want to be able to see frequently asked questions
  
  Background:
    Given the following faq questions exist:
    | title | content |
    | Helpful | Information |
  
  Scenario: View FAQ page
    Given I am logged in
    And I am on the user dashboard page
    When I follow "FAQ"
    Then I should see "Frequently Asked Questions"
    And I should see "Question"
    And I should see "Answer"
    And I should see "Actions"
    And I should see "Helpful"
    And I should see "Information"
    And I should not see "Destroy"
    And I should not see "New At-Risk Form"
    And I should not see "New Autism Alert Form"
    

  Scenario: Add to FAQ page
    Given I am logged in as admin
    And I am on the user dashboard page
    When I follow "FAQ"
    Then I should see "New FAQ"
    And I should see "Edit"
    And I should see "Destroy"
    When I follow "New FAQ"
    And I fill in "faq_title" with "Help"
    And I fill in "faq_content" with "Yes"
    And I press "Create FAQ"
    Then I should see "Help"
    And I should see "Yes"
  
  Scenario: Delete from FAQ page
    Given I am logged in as admin
    And I am on the user dashboard page
    When I follow "FAQ"
    Then I should see "Helpful"
    And I should see "Destroy"
    When I follow "Destroy"
    Then I should not see "Helpful"