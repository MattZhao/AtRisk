# Feature: create new form
#   As a guardian of at risk people
#   In order to track their info
#   I want to view the forms that I submitted before

#   Background:
#     Given I am logged in as "MattZhao"
#     And the following forms exist:
#     | name | type | id_user |
#     | Matthew | Autism | MattZhao|
#     | Banana | AtRisk | MamaBanana|
    
#   Scenario: view submitted form on Dashboard
#     Given I am on the user dashboard page
#     Then I should see "Matthew"
#     But I should not see "Banana"
    
#   Scenario: view the detailed form
#     Given I am on the user dashboard page
#     When I press "Matthew"
#     Then I should be on the Detailed Form page
#     And I should see "Matthew"
    