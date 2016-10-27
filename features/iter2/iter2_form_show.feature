Feature: create new form
  As a guardian of many at risk people
  In order to track two kinds of people's info
  I want to view the two kinds of forms that I submitted before

  Background:
  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | id_user | address | has_alzheimers |
    | Matthew | 01/01/1950 | ~/pic.jpg | 1 | Telegraph Ave | F |

    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics |
    | Matthew, Jr. | 01/01/2000 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI |

  Scenario: The user should be able to access correct rendered atrisk page
    Given I am on the user dashboard page
    When I go to the info page for "Matthew"
    Then I should see "This individual has Alzheimer's"
    But I should not see "Favorite Topics"
    
  Scenario: The user should be able to access correct rendered autism page
    Given I am on the user dashboard page
    When I go to the info page for "Matthew, Jr."
    Then I should not see "This individual has Alzheimer's"
    But I should see "Favorite Topics"
    