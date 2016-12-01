Feature: download form as pdf
  As a user who has logged in
  I want to be able to view the forms as pdf 
  and download them as pdf
  
  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type |
    | Matthew | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | AtRisk |

    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type |
    | Matthew, Jr. | 01/01/1990 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism |

  Scenario: download an AtRisk form in the format of pdf when on detailed view
    Given I am on the user dashboard page
    Then I should see "View Forms"
    Then I should find that form table contains "Matthew"
    When I go to the info page for "Matthew"
    Then I should see "Download As PDF"
    And I follow "Download As PDF"
    Then I should receive a file "Matthew AtRisk Form.pdf"

  Scenario: download an Autism form in the format of pdf when on detailed view
    Given I am on the user dashboard page
    Then I should see "View Forms"
    Then I should find that form table contains "Matthew, Jr."
    When I go to the info page for "Matthew, Jr."
    Then I should see "Download As PDF"
    And I follow "Download As PDF"
    Then I should receive a file "Matthew, Jr. Autism Form.pdf"
    