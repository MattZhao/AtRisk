Feature: Sign up
  In order to manage my users
  As admin
  I want to be able to view user info and do management stuff

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

    Scenario: Search stuff
      Given I am on the user dashboard page
      When I fill in "search_fillin" with "Milton"
      And I press "search_submit"
      Then I should see "Milton"
      But I should not see "Matthew"
    
      