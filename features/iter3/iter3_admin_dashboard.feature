Feature: log in and see the dashboard
  As a police officer
  In order to be manage the site
  I want to  see my dashboard with admin features

  Background:
    Given I exist as a user
    Given I am logged in
    And I am not logged in
    And I am logged in as admin
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type | created_at | updated_at |
    | Milton | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | AtRisk | 01/01/1950 | 01/01/1950 |
    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type | created_at | updated_at |
    | Matthew, Jr. | 01/01/1990 | ~/pic.jpg | 2 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism | 01/01/1950 | 01/01/1950 |
    
  Scenario: Successfully see dashboard
    Given I am on the user dashboard page
    Then I should see "View Forms"
    And I should see "New At-Risk Form"
    And I should see "New Autism Alert Form"
    And I should see "Manage Users"
    And I should see "FAQ"
    
  Scenario: See all of the forms in db
    Given I am on the user dashboard page
    Then I should see "Milton"
    And I should see "Matthew, Jr."
    
  Scenario: Manage user
    Given I am on the user dashboard page
    And I follow "Manage Users"
    Then I should see "Testy McUserton"
    
  Scenario: Forms Count
    Given I am on the user dashboard page
    Then I should see "Total Forms: 2"