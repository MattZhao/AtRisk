Feature: create new rigorous form 
  As a guardian of an at risk or autism person
  In order to report at risk person information
  I want to create forms
  
Background:
  Given I am logged in

Scenario: navigate to create At-Risk form
  Given I am on the user dashboard page
  When I follow "New At-Risk Form"
  Then I should see "Create New At Risk Form"
  And I should see "This person has Alzheimer"
  And I should not see "Individual's favorite toys, objects, music, discussion topics, likes, and dislikes"
  
Scenario: navigate to create Autism form
  Given I am on the user dashboard page
  When I follow "New Autism Alert Form"
  Then I should see "Create New Autism Alert Form"
  And I should see "Individuals favorite toys, objects, music, discussion topics, likes, and dislikes"
  And I should not see "This person has Alzheimer's"

Scenario: create new atrisk form
  Given I am on the new At-Risk form page
  When I fill in "Individuals Name" with "Matthew"
  When I select "May 2, 2011" as the form "birth_date" date
  When I fill in "Photo of the Individual" with "pic.jpg"
  And I press "Submit Form"
  Then I should see "Successfully Created Form for Matthew"
  And I should be on the user dashboard page
  And I should find that form table contains "Matthew"
  And I should find that form table contains "2011-05-02"

# Scenario: create new autism form
#   Given I am on the new Autism form page
#   When I fill in "Individuals Name" with "Matthew, Jr"
#   And I fill in "Date of Birth" with "1/1/2000"
#   And I fill in "Individuals favorite toys, objects, music, discussion topics, likes, and dislikes" with "stuffed animals"
#   #And I upload picture with "pic.jpg"
#   And I press "Submit Form"
#   Then I should see "Successfully Created Form for Matthew, Jr"
#   And I should be on the user dashboard page
#   And I should find that form table contains "Matthew, Jr"
#   And I should find that form table contains "1/1/2000"
  

# Scenario: unable to create new atrisk form if required fields are not filled
#   Given I am on the new At-Risk form page
#   When I fill in "Individuals Name" with "Matthew"
#   And I press "Submit Form"
#   Then I should see "Unable to Created Form for Matthew"
#   And I should be on the user dashboard page
#   And I should not find that form table contains "Matthew"

# Scenario: unable to create new autism form if required fields are not filled
#   Given I am on the new Autism form page
#   When I fill in "Individuals Name" with "Matthew, Jr"
#   And I press "Submit Form"
#   Then I should see "Unable to Created Form for Matthew, Jr"
#   And I should be on the user dashboard page
#   And I should not find that form table contains "Matthew, Jr"
