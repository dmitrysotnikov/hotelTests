Feature: Edit Content

  Background:
    Given I am login to backend as staff

  Scenario: Content manager should be able to edit folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press 'Edit' button for 'testFolder' item
    And I edit folder using the following data:
      | title         |
      | NewtestFolder |
    Then I should see 'NewtestFolder' item on content management page

  Scenario: Content manager should be able to edit service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    And I press 'Edit' button for 'testService' item
    And I edit service using the following data:
      | title          |
      | NewtestService |
    Then I should see 'NewtestService' item on content management page

  Scenario: Content manager should be able to edit info

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    And I press 'Edit' button for 'testInfo' item
    And I edit info using the following data:
      | title       |
      | NewtestInfo |
    Then I should see 'NewtestInfo' item on content management page

  Scenario: Content manager should be able to edit link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                |
      | testLink | https://google.com |
    And I press 'Edit' button for 'testLink' item
    And I edit link using the following data:
      | title       |
      | NewtestLink |
    Then I should see 'NewtestLink' item on content management page

  Scenario: Content manager should be able to edit enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I press 'Edit' button for 'testEnquiry' item
    And I edit enquiry using the following data:
      | title          |
      | NewtestEnquiry |
    Then I should see 'NewtestEnquiry' item on content management page