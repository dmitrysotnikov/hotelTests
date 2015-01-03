Feature: Upload Image

  Background:
    Given I am login to backend as staff

  Scenario: Content manager should be able to create service with image

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | image               |
      | testService | funny-animals-2.jpg |
    Then I should see 'testService' item on content management page
    And 'default service' image for 'testService' item should not be visible on content management page


  Scenario: Content manager should be able to create folder with image

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | image               |
      | testFolder | funny-animals-2.jpg |
    Then I should see 'testFolder' item on content management page
    And 'default folder' image for 'testFolder' item should not be visible on content management page


  Scenario: Content manager should be able to create info with image

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | image               |
      | testInfo | funny-animals-2.jpg |
    Then I should see 'testInfo' item on content management page
    And 'default info' image for 'testInfo' item should not be visible on content management page


  Scenario: Content manager should be able to create link with image

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | image               | url                     |
      | testLink | funny-animals-2.jpg | https://www.google.com/ |
    Then I should see 'testLink' item on content management page
    And 'default link' image for 'testLink' item should not be visible on content management page


  Scenario: Content manager should be able to create enquiry with image

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       | image               |
      | testEnquiry | funny-animals-2.jpg |
    Then I should see 'testEnquiry' item on content management page
    And 'default link' image for 'testEnquiry' item should not be visible on content management page
