Feature: Upload file
  As a common user
  In order attach relevant file such as photos
  I should be able to upload file to the server
  
  
  Scenario: Logged in can choose a file from local file system to upload to the server
    Given I am logged in
    And I am on the file uploading test page
    Then I should see "choose the file you want to upload"
    When I choose to upload file at "~/tmp/image.png"
    And I press "upload"
    Then I should see the image "image.png"
    
  Scenario: User must log in to upload file
    Given I am not logged in 
    And I am on the file uploading test page
    Then I should see "You must log in to upload file."