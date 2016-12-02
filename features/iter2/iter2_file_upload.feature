Feature: Upload file
  As a common user
  In order attach relevant file such as photos
  I should be able to upload file to the server
  
  
  Scenario: Logged in user can upload photo when creating a new autism form
    Given I am logged in
    And I am on the user dashboard page
    When I follow "New Autism Alert Form"
    Then I should see "Photos (image, pdf, etc.)"
    And I should see a field "form_attachments[file][]"
    When I fill in "Individuals Name" with "Matthew"
    And I select "May 2, 1950" as the form "birth_date" date
    And I upload a file called "img1.png"
    And I check "form_terms_of_service"
    And I press "Submit Form"
    Then I should see "Successfully Created Form for Matthew"
    And I should be on the user dashboard page
    When I go to the info page for "Matthew"
    Then I should see "Autism Alert Form for Matthew"
    And I should see the image "img1.png"
    