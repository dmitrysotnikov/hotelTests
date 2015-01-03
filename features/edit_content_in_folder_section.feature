Feature: Edit content on section

  Background:
    Given I am login to backend as staff

  Scenario: User should be able to edit the service inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new service using the following data:
      | title       |
      | testService |
    Then I should see 'testService' item on content management page
    And I press 'Edit' button for 'testService' item
    And I edit service using the following data:
      | title          |
      | NewTestService |
    Then I should see 'NewTestService' item on content management page


  Scenario: User should be able to edit the info inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page
    And I press 'Edit' button for 'testInfo' item
    And I edit info using the following data:
      | title       |
      | NewTestInfo |
    Then I should see 'NewTestInfo' item on content management page


  Scenario: User should be able to edit the link inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new link using the following data:
      | title    | url                     |
      | testLink | https://www.google.com/ |
    Then I should see 'testLink' item on content management page
    And I press 'Edit' button for 'testLink' item
    And I edit link using the following data:
      | title       | url                     |
      | NewTestLink | https://www.google.com/ |
    Then I should see 'NewTestLink' item on content management page


  Scenario: User should be able to edit the enquiry inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    Then I should see 'testEnquiry' item on content management page
    And I press 'Edit' button for 'testEnquiry' item
    And I edit enquiry using the following data:
      | title          |
      | NewTestEnquiry |
    Then I should see 'NewTestEnquiry' item on content management page
