Feature: Edit rigorous form
    As a user who has some historical data on the app
    In order to make some changes to the data
    I want to update one of my records

  Background:
    Given I am logged in
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type |
    | Matthew | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | AtRisk |

    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type |
    | Matthew, Jr. | 01/01/1990 | ~/pic.jpg | 1 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism |

  Scenario: The user should be able to access the edit atrisk page
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should see "Edit At Risk Form"
    And I should see "This person has Alzheimer"
    And I should not see "Individuals favorite toys, objects, music, discussion topics, likes, and dislikes"
    And I check "form_terms_of_service"
    And I press "Update Form"
    Then the birth_date of "Matthew" should be "01/01/1950"
    And the address of "Matthew" should be "Telegraph Ave"
    #And the "has_alzheimers" should be checked
  
  Scenario: Edit should go through for atrisk
    Given I am on the user dashboard page
    When I go to the edit page for "Matthew"
    And I fill in "Individuals Name" with "Matt"
    And I check "form_terms_of_service"
    And I press "Update Form"
    Then I should see "Matt"
    And I should see "The information for Matt is successfully updated"
    And I should not see "Matthew"

  Scenario: The user should be able to access the edit autism page
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    When I go to the edit page for "Matthew, Jr."
    Then I should see "Edit Autism Alert Form"
    And I should see "Individuals favorite toys, objects, music, discussion topics, likes, and dislikes"
    And I should not see "This person has Alzheimer"
    When I check "form_terms_of_service"
    And I press "Update Form"
    Then the birth_date of "Matthew, Jr." should be "01/01/1990"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI"
    
  Scenario: Edit should go through for autism
    Given I am on the user dashboard page
    When I go to the edit page for "Matthew, Jr."
    And I fill in "Individuals Name" with "Matt, Jr"
    And I check "form_terms_of_service"
    And I press "Update Form"
    Then I should see "Matt, Jr"
    And I should see "The information for Matt, Jr is successfully updated"
    And I should not see "Matthew, Jr"

  Scenario: The user should not be able to update the atrisk form if required fields are missing
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should see "Edit At Risk Form"
    And I fill in "Individuals Name" with ""
    And I check "form_terms_of_service"
    And I press "Update Form"
  #  Then I should see "Please fill in required fields."

  Scenario: The user should not be able to update the autism form if required fields are missing
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    When I go to the edit page for "Matthew, Jr."
    Then I should see "Edit Autism Alert Form"
    And I fill in "Individuals Name" with ""
    And I check "form_terms_of_service"
    And I press "Update Form"
    #  Then I should see "Please fill in required fields."

  Scenario: The user should be able to cancel edit atrisk form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew" should be "01/01/1950"
    And the address of "Matthew" should be "Telegraph Ave"
    When I go to the edit page for "Matthew"
    Then I should be on the edit page for "Matthew"
    And I fill in "Address" with "Shattuck Ave"
    And I follow "Cancel"
    Then the address of "Matthew" should be "Telegraph Ave"

  Scenario: The user should be able to cancel autism form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew, Jr." should be "01/01/1990"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI"
    When I go to the edit page for "Matthew, Jr."
    Then I should be on the edit page for "Matthew, Jr."
    And I fill in "Address" with "Shattuck Ave"
    And I fill in "Individuals favorite toys, objects, music, discussion topics, likes, and dislikes" with "NVIDIA GeForce GTX 1080 SLI"
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
    And I check "form_terms_of_service"
    And I press "Update Form"
    Then the address of "Matthew" should be "Shattuck Ave"
   
  Scenario: The user should be able to edit autism form
    Given I am on the user dashboard page
    Then I should see "Testy McUserton"
    And the birth_date of "Matthew, Jr." should be "01/01/1990"
    And the address of "Matthew, Jr." should be "Telegraph Ave"
    And the favorite_topics of "Matthew, Jr." should be "GTX TITAN 4-Way SLI"
    When I go to the edit page for "Matthew, Jr."
    Then I should be on the edit page for "Matthew, Jr."
    And I fill in "Address" with "Shattuck Ave"
    And I fill in "Individuals favorite toys, objects, music, discussion topics, likes, and dislikes" with "NVIDIA GeForce GTX 1080 SLI"
    And I check "form_terms_of_service"
    And I press "Update Form"
    Then the address of "Matthew, Jr." should be "Shattuck Ave"
    And the favorite_topics of "Matthew, Jr." should be "NVIDIA GeForce GTX 1080 SLI"

