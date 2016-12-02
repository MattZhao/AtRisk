Feature: Sort forms
  As a user with a lot of forms
  In order to see what I want first
  I want to sort the forms I see
  
  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type |
    | Milton | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | AtRisk |
    | Steve | 02/02/1948 | ~/pic.jpg | checked | 1 | Shattuck Ave | AtRisk |
    
    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type |
    | Matthew, Jr | 01/01/1990 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism |
  
  Scenario: Sort by name
    Given I am on the user dashboard page
    When I follow "Name"
    Then "Matthew, Jr" should appear before "Steve"
  
  Scenario: Sort by birth_date
    Given I am on the user dashboard page
    When I follow "Birth Date"
    Then "Steve" should appear before "Milton"
    And "Milton" should appear before "Matthew, Jr"
    