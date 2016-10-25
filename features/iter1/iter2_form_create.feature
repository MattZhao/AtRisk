Feature: create new rigorous form 
  As a guardian of an at risk or autism person
  In order to report at risk person information
  I want to create forms
  
Background:
  Given I am logged in

Scenario: navigate to create rigorous form
  Given I am on the user dashboard page
  When I follow "New At-Risk Form"
  Then I should be on the new form page

Scenario: create new atrisk form
  Given I am on the new atrisk form page
  Then I should see "Successfully Created Form for Matthew"
  And I should see "This person has Alzheimer's"
  And I should not see "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes"
  When I fill in "Individuals Name" with "Matthew"
  And I fill in "Date of birth" with "1/1/1950"
  And I upload picture with "pic.jpg"
  And I press "Submit Form"
  Then I should see "Successfully Created Form for Matthew"
  When I am on the new form page
  When I am on the user dashboard page
  And I should find that form table contains "Matthew"

Scenario: create new autism form
  Given I am on the new autism form page
  Then I should see "Successfully Created Form for Matthew, Jr"
  And I should see "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes"
  And I should not see "This person has Alzheimer's"
  When I fill in "Individuals Name" with "Matthew, Jr"
  And I fill in "Date of birth" with "1/1/2000"
  And I upload picture with "pic.jpg"
  And I press "Submit Form"
  Then I should see "Successfully Created Form for Matthew, Jr"
  When I am on the new form page
  When I am on the user dashboard page
  And I should find that form table contains "Matthew, Jr"

Scenario: unable to create new atrisk form if required fields are not filled
  Given I am on the new atrisk form page
  When I fill in "Individuals Name" with "Matthew"
  And I press "Submit Form"
  Then I should see "Unable to Created Form for Matthew"
  When I am on the new form page
  When I am on the user dashboard page
  And I should not find that form table contains "Matthew"

Scenario: unable to create new autism form if required fields are not filled
  Given I am on the new autism form page
  When I fill in "Individuals Name" with "Matthew, Jr"
  And I press "Submit Form"
  Then I should see "Unable to Created Form for Matthew, Jr"
  When I am on the new form page
  When I am on the user dashboard page
  And I should not find that form table contains "Matthew, Jr"
