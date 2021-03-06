Feature: Filter forms
  As a user with a lot of forms
  In order to see less clutter
  I want to filter the forms I see
  
  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type |
    | Millton | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | AtRisk |

    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type |
    | Matthew, Jr. | 01/01/1990 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism |
  
  Scenario: The user should be able to filter atrisk and see only autism forms
    Given I am on the user dashboard page
    And I should see "Millton"
    And I should see "Matthew, Jr."
    When I uncheck "types_AtRisk"
    And I press "Reload"
    Then I should see "Matthew, Jr."
    And I should not see "Millton"
  
  Scenario: The user should be able to filter autism and see only atrisk forms
    Given I am on the user dashboard page
    And I should see "Millton"
    And I should see "Matthew, Jr."
    When I uncheck "types_Autism"
    And I press "Reload"
    Then I should see "Millton"
    And I should not see "Matthew, Jr."

  