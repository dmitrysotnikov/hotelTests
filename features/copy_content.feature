Feature: Copy content

  Background:
    Given I am login to backend as staff

   Scenario: Content manager should be able to copy the service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    And I 'Copy' 'testService' to 'pre-setup HOME'
    Then I should see 2 'testService' items on content management page

     Scenario: Content manager should be able to copy the folder

     When I open [Content Manager] page
     And I create new folder using the following data:
       | title      |
       | testFolder |
     And I 'Copy' 'testFolder' to 'pre-setup HOME'
     Then I should see 2 'testFolder' items on content management page

   Scenario: Content manager should be able to copy the info

     When I open [Content Manager] page
     And I create new info using the following data:
       | title    |
       | testInfo |
     And I 'Copy' 'testInfo' to 'pre-setup HOME'
     Then I should see 2 'testInfo' items on content management page

   Scenario: Content manager should be able to copy the link

     When I open [Content Manager] page
     And I create new link using the following data:
       | title     |        url              |
       | testLink  | https://www.google.com/ |
     And I 'Copy' 'testLink' to 'pre-setup HOME'
     Then I should see 2 'testLink' items on content management page


  Scenario: Content manager should be able to copy enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I 'Copy' 'testEnquiry' to 'pre-setup HOME'
    Then I should see 2 'testEnquiry' items on content management page