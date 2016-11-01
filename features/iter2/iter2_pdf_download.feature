Feature: download form as pdf
  As a user who has logged in
  I want to be able to view the forms as pdf 
  and download them as pdf
  
  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | id_user | address | has_alzheimers |
    | Matthew | 01/01/1950 | ~/pic.jpg | 1 | Telegraph Ave | F |

    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics |
    | Steve Jobs | 01/01/2000 | ~/pic2.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI |

  # download all forms that belongs to the user when on dashboard
  Scenario: download all forms when on dashboard
    Given I am on the user dashboard page
    Then I should find that form table contains "Matthew"
    And I should find that form table contains "Steve Jobs"
    And I should find that form table contains "Download As PDF"
    When I follow "Download As PDF"
    Then I should see "All forms have been successfully downloaded!"
    
  # download a single form on details page
  Scenario: download a single form when on its details page
    Given I am on the user dashboard page
    Then I should find that form table contains "Matthew"
    And I should find that form table contains "Steve Jobs"
    And I should find that form table contains "Download As PDF"
    When I follow "Steve Jobs"
    And I should not find that form table contains "Matthew"
    And I should find that form table contains "GTX TITAN 4-Way SLI"
    And I should find that form table contains "Download As PDF"
    When I follow "Download As PDF"
    Then I should see "Your form has been successfully downloaded!"
    