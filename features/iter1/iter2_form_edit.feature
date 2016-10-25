Feature: Edit rigorous form
    As a user who has some historical data on the app
    In order to make some changes to the data
    I want to update one of my records

  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | id_user | address | has_alzheimers |
    | Matthew | 01/01/1950 | ~/pic.jpg | 1 | Telegraph Ave | F |

    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics |
    | Matthew, Jr. | 01/01/2000 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI |

  Scenario: The user should be able to access the edit atrisk page
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit atrisk page for "Matthew"
    And I should see "This person has Alzheimer's"
    And I should not see "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes"
    And I press "Update Form"
    Then the birth_date of "Matthew" should be "01/01/1950"
    And the address of "Matthew" should be "Telegraph Ave"
    And the has_alzheimers of "Matthew" should be "F"

  Scenario: The user should be able to access the edit autism page
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    When I go to the edit page for "Matthew, Jr."
    Then I should be on the edit autism page for "Matthew, Jr."
    And I should see "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes"
    And I should not see "This person has Alzheimer's"
    And I press "Update Form"
    Then the birth_date of "Matthew, Jr." should be "01/01/1990"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI "

  Scenario: The user should not be able to update the atrisk form if required fields are missing
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit atrisk page for "Matthew"
    And I fill in "Individual's Name" with ""
    And I press "Update Form"
    Then I should see "Unable to update the form, required fields must be filled."

  Scenario: The user should not be able to update the autism form if required fields are missing
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    When I go to the edit page for "Matthew, Jr."
    Then I should be on the edit autism page for "Matthew, Jr."
    And I fill in "Individual's Name" with ""
    And I press "Update Form"
    Then I should see "Unable to update the form, required fields must be filled."

  Scenario: The user should be able to cancel edit atrisk form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew" should be "01/01/1950"
    And the address of "Matthew" should be "Telegraph Ave"
    And the has_alzheimers of "Matthew" should be "F"
    When I go to the edit page for "Matthew"
    Then I should be on the edit page for "Matthew"
    And I fill in "Address" with "Shattuck Ave"
    And I fill in "This person has Alzheimer's" with "T"
    And I follow "Cancel"
    Then the address of "Matthew" should be "Telegraph Ave"
    And the has_alzheimers of "Matthew" should be "F"

  Scenario: The user should be able to cancel autism form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew, Jr." should be "01/01/2000"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI"
    When I go to the edit page for "Matthew, Jr."
    Then I should be on the edit page for "Matthew, Jr."
    And I fill in "Address" with "Shattuck Ave"
    And I fill in "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes" with "NVIDIA GeForce GTX 1080 SLI"
    And I follow "Cancel"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI"
    
  Scenario: The user should be able to edit atrisk form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew" should be "01/01/1950"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit page for "Matthew"
    And I fill in "Address" with "Shattuck Ave"
    And I fill in "This person has Alzheimer's" with "T"
    And I press "Update Form"
    Then the address of "Matthew" should be "Shattuck Ave"
    And the has_alzheimers of "Matthew" should be "T"
   
  Scenario: The user should be able to edit autism form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew, Jr." should be "01/01/2000"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI"
    When I go to the edit page for "Matthew, Jr."
    Then I should be on the edit page for "Matthew, Jr."
    And I fill in "Address" with "Shattuck Ave"
    And I fill in "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes" with "NVIDIA GeForce GTX 1080 SLI"
    And I press "Update Form"
    Then the address of "Matthew, Jr." should be "Shattuck Ave"
    And the favorite_topics of "Matthew, Jr." should be "NVIDIA GeForce GTX 1080 SLI"

