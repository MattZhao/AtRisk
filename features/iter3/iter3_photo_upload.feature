Feature: Upload photos
  As a common user
  In order to provide image information of the person concerned
  I should be able to attach photos in the form_activeness
  
  Scenario: User can upload up to 5 files when creating the form
    Given I am logged in
    And I am on the user dashboard page
    When I follow "New Autism Alert Form"
    And I upload 5 photos
    And I fill in the required fields
    And I press "submit"
    Then I should see "Successfully Created Form for"
    And I should be on the user dashboard page