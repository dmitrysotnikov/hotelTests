Feature: Move content

  Background:
    Given I am login to backend as staff


  Scenario: Content manager should be able to move the service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    And I 'Move' 'testService' to 'pre-setup -MoveFolder'
    And I press on 'pre-setup MoveFolder' item from list
    Then I should see 1 'testService' items on content management page


  Scenario: Content manager should be able to move the folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I 'Move' 'testFolder' to 'pre-setup -MoveFolder'
    And I press on 'pre-setup MoveFolder' item from list
    Then I should see 1 'testFolder' items on content management page


  Scenario: Content manager should be able to move the info

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    And I 'Move' 'testInfo' to 'pre-setup -MoveFolder'
    And I press on 'pre-setup MoveFolder' item from list
    Then I should see 1 'testInfo' items on content management page


  Scenario: Content manager should be able to move the link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     |
      | testLink | https://www.google.com/ |
    And I 'Move' 'testLink' to 'pre-setup -MoveFolder'
    And I press on 'pre-setup MoveFolder' item from list
    Then I should see 1 'testLink' items on content management page


  Scenario: Content manager should be able to move enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I 'Move' 'testEnquiry' to 'pre-setup -MoveFolder'
    And I press on 'pre-setup MoveFolder' item from list
    Then I should see 1 'testEnquiry' items on content management page


  Scenario: Content manager should be able to drag and drop item

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I wait 3 seconds
    And I create new folder using the following data:
      | title                 |
      | pre-setup testFolder2 |
      | pre-setup testFolder3 |
    And I drag-and-drop 'testFolder2' item to 'testFolder3' item
    #Then I should see 'testFolder2' item after 'testFolder3'
