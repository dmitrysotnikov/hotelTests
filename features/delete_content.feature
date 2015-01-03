Feature: Delete Content

  Background:
    Given I am login to backend as staff

  Scenario: Content manager should be able to delete link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                |
      | testLink | https://google.com |
    Then I should see 'testLink' item on content management page
    When I press 'Delete' button for 'testLink' item
    And I 'confirm' deletion
    Then I should not see 'testLink' item on content management page

  Scenario: Content manager should be able to delete folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    Then I should see 'testFolder' item on content management page
    When I delete 'testFolder' item
    Then I should not see 'testFolder' item on content management page

  Scenario: Content manager should be able to delete service

    When I open [Content Manager] page
    And I create new service using the following data:
        | title       |
        | testService |
    Then I should see 'testService' item on content management page
    When I delete 'testService' item
    Then I should not see 'testService' item on content management page

  Scenario: Content manager should be able to delete info

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page
    When I delete 'testInfo' item
    Then I should not see 'testInfo' item on content management page

  Scenario: Content manager should be able to delete enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I delete 'testEnquiry' item
    Then I should not see 'testEnquiry' item on content management page


  Scenario: Content manager should be able to decline link deletion

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                |
      | testLink | https://google.com |
    Then I should see 'testLink' item on content management page
    When I press 'Delete' button for 'testLink' item
    And I 'decline' deletion
    Then I should see 'testLink' item on content management page

  Scenario: Content manager should be able to decline folder deletion

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    Then I should see 'testFolder' item on content management page
    When I press 'Delete' button for 'testFolder' item
    And I 'decline' deletion
    Then I should see 'testFolder' item on content management page

  Scenario: Content manager should be able to decline service deletion

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    Then I should see 'testService' item on content management page
    When I press 'Delete' button for 'testService' item
    And I 'decline' deletion
    Then I should see 'testService' item on content management page

  Scenario: Content manager should be able to decline info deletion

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page
    When I press 'Delete' button for 'testInfo' item
    And I 'decline' deletion
    Then I should see 'testInfo' item on content management page

  Scenario: Content manager should be able to decline enquiry deletion

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    When I press 'Delete' button for 'testEnquiry' item
    And I 'decline' deletion
    Then I should see 'testEnquiry' item on content management page


  Scenario: Content manager should be able to restore deleted folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I delete 'testFolder' item
    And I click ['Trash'] button at content page
    Then I should see 'testFolder' item on content management page
    When I 'Move' 'testFolder' to 'pre-setup HOME'
    And I click ['testalex'] button at content page
    Then I should see 'testFolder' item on content management page


  Scenario: Content manager should be able to restore deleted service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title      |
      | testService |
    And I delete 'testService' item
    And I click ['Trash'] button at content page
    Then I should see 'testService' item on content management page
    When I 'Move' 'testService' to 'pre-setup HOME'
    And I click ['testalex'] button at content page
    Then I should see 'testService' item on content management page


  Scenario: Content manager should be able to restore deleted enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      |   title     |
      | testEnquiry |
    And I delete 'testEnquiry' item
    And I click ['Trash'] button at content page
    Then I should see 'testEnquiry' item on content management page
    When I 'Move' 'testEnquiry' to 'pre-setup HOME'
    And I click ['testalex'] button at content page
    Then I should see 'testEnquiry' item on content management page


  Scenario: Content manager should be able to restore deleted info

    When I open [Content Manager] page
    And I create new info using the following data:
      |   title  |
      | testInfo |
    And I delete 'testInfo' item
    And I click ['Trash'] button at content page
    Then I should see 'testInfo' item on content management page
    When I 'Move' 'testInfo' to 'pre-setup HOME'
    And I click ['testalex'] button at content page
    Then I should see 'testInfo' item on content management page


  Scenario: Content manager should be able to restore deleted link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                |
      | testLink | https://google.com |
    And I delete 'testLink' item
    And I click ['Trash'] button at content page
    Then I should see 'testLink' item on content management page
    When I 'Move' 'testLink' to 'pre-setup HOME'
    And I click ['testalex'] button at content page
    Then I should see 'testLink' item on content management page