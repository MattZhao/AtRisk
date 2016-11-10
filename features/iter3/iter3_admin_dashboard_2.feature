Feature: log in and see counts and manipulate forms table
  As a police officer
  I want to  see my dashboard with form counts
  and be able to apply activeness filter
  and sort the forms by clicking the headers

  Background:
    Given I exist as a user
    Given I am logged in as admin
    And the following atrisk forms exist:
    | name | birth_date | photo_path | has_alzheimers |id_user | address | form_type | form_activeness
    | Milton | 01/01/1950 | ~/pic.jpg | checked | 1 | Telegraph Ave | Autism | true
    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type | form_activeness
    | Matthew, Jr. | 01/01/1990 | ~/pic2.jpg | 2 | Telegraph Ave | GTX TITAN 4-Way SLI | Autism | false
    And the following autism forms exist:
    | name | birth_date | photo_path | id_user | address | favorite_topics | form_type | form_activeness
    | Donald Trump | 03/06/1940 | ~/pic3.jpg | 3 | College Ave | Melania Trump | AtRisk | true

  Scenario: Successfully see form counts and names
    Given I am on the user dashboard page
    Then I should see "Milton"
    And I should see "Matthew, Jr."
    And I should see "Donald Trump"
    Then I should see "number of all forms: 3"
    Then I should see "number of active forms: 2"
    Then I should see "number of inactive forms: 1"

    
  Scenario: filter out inactive forms
    Given I am on the user dashboard page
    Then I should see "Milton"
    And I should see "Matthew, Jr."
    And I should see "Donald Trump"
    And I should see "active"
    And I should see "inactive"
    When I uncheck "inactive"
    And I press "Reload"
    Then I should see "Milton"
    Then I should see "Donald Trump"
    And I should not see "Matthew, Jr."
    
  Scenario: Sort by name
    Given I am on the user dashboard page
    When I follow "Name"
    Then "Donald Trump" should appear before "Milton"
    And "Milton" should appear before "Matthew, Jr"
  
  Scenario: Sort by birth_date
    Given I am on the user dashboard page
    When I follow "Birth Date"
    Then "Donald Trump" should appear before "Milton"
    And "Milton" should appear before "Matthew, Jr"

  Scenario: Sort form_activeness
    Given I am on the user dashboard page
    When I follow "form_activeness"
    Then "Donald Trump" should appear before "Matthew, Jr"
    And "Milton" should appear before "Matthew, Jr"
