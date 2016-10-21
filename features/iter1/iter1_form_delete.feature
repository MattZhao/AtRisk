# Feature: Delete form
#   As a guardian of an at risk person
#   In order to keep this database up-to-date
#   I want to delete one of my records

#   Background:
#     Given I am logged in
#     And the following forms exist:
#     | name | form_type | id_user |
#     | Matthew | autism | 0 |

#   Scenario: Delete form
#     Given I am on the user dashboard page
#     Then I should see "Matthew"
#     When I goooo to info page for the first item in database
#     And I follow "Delete Form"
#     #And I accept the alart
#     Then I should see "Form for Matthew Zhao is deleted"
#     And I should not see "Matthew"
    