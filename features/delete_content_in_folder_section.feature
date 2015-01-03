Feature: Delete content on section

  Background:
    Given I am login to backend as staff

  Scenario: User should be able to delete the service inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new service using the following data:
      | title       | hint    | image               | price  | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200    | yes             | Wow         |
    Then I should see 'testService' item on content management page
    When I press 'Delete' button for 'testService' item
    And I 'confirm' deletion
    Then I should not see 'testService' item on content management page


  Scenario: User should be able to delete the info inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new info using the following data:
      | title    | hint        | phone     |
      | testInfo | test folder | 123123123 |
    Then I should see 'testInfo' item on content management page
    When I press 'Delete' button for 'testInfo' item
    And I 'confirm' deletion
    Then I should not see 'testInfo' item on content management page


  Scenario: User should be able to delete the link inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new link using the following data:
      | title    | hint      | description     | image               | url                     | embed_website | skip_popup |
      | testLink | test Link | testDescription | funny-animals-2.jpg | https://www.google.com/ | yes           | yes        |
    Then I should see 'testLink' item on content management page
    When I press 'Delete' button for 'testLink' item
    And I 'confirm' deletion
    Then I should not see 'testLink' item on content management page


  Scenario: User should be able to delete the enquiry inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new enquiry using the following data:
      | title       | hint        | phone     |
      | testEnquiry | test folder | 123123123 |
    Then I should see 'testEnquiry' item on content management page
    When I press 'Delete' button for 'testEnquiry' item
    And I 'confirm' deletion
    Then I should not see 'testEnquiry' item on content management page
