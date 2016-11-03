Feature: Filter forms
  As a user with a lot of forms
  In order to see less clutter
  I want to search for specific forms
    
  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type |
    | Milton | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | AtRisk |
    | Steve | 02/02/1948 | ~/pic.jpg | checked | 1 | Shattuck Ave | AtRisk |
    
    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type |
    | Matthew, Jr. | 01/01/1990 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism |
    
  Scenario: Search by name
    Given I am on the user dashboard page
    When I fill in "search" with "St"
    And I press "Search"
    Then I should see "Steve"
    And I should not see "Milton"
    And I should not see "Matthew, Jr."


    