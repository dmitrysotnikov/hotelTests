Feature: Create reference

  Background:
    Given I am login to backend as staff

  Scenario: Content manager should be able to reference service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    And I 'Reference' 'testService' to 'pre-setup HOME'
    Then I should see 2 'testService' items on content management page

  Scenario: Content manager should be able to reference the folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I 'Reference' 'testFolder' to 'pre-setup HOME'
    Then I should see 2 'testFolder' items on content management page

  Scenario: Content manager should be able to reference the info

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    And I 'Reference' 'testInfo' to 'pre-setup HOME'
    Then I should see 2 'testInfo' items on content management page

  Scenario: Content manager should be able to reference the link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    |        url              |
      | testLink | https://www.google.com/ |
    And I 'Reference' 'testLink' to 'pre-setup HOME'
    Then I should see 2 'testLink' items on content management page

  Scenario: Content manager should be able to reference the enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I 'Reference' 'testEnquiry' to 'pre-setup HOME'
    Then I should see 2 'testEnquiry' items on content management page


  Scenario: Referenced link should change name after changing common link's name

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     |
      | testLink | https://www.google.com/ |
    And I 'Reference' 'testLink' to 'pre-setup HOME'
    And I press 'Edit' button for 'testLink' item
    And I edit link using the following data:
      | title      | url                     |
      | NewTestLink| https://www.google.com/ |
    And I refresh the page
    Then I should see 2 'NewTestLink' items on content management page

  Scenario: Referenced folder should change name after changing common folder's name

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I 'Reference' 'testFolder' to 'pre-setup HOME'
    And I press 'Edit' button for 'testFolder' item
    And I edit folder using the following data:
      | title         |
      | NewTestFolder |
    And I refresh the page
    Then I should see 2 'NewTestFolder' items on content management page

  Scenario: Referenced info should change name after changing common info's name

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    And I 'Reference' 'testInfo' to 'pre-setup HOME'
    And I press 'Edit' button for 'testInfo' item
    And I edit info using the following data:
      | title       |
      | NewTestInfo |
    And I refresh the page
    Then I should see 2 'NewTestInfo' items on content management page

  Scenario: Referenced service should change name after changing common service's name

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    And I 'Reference' 'testService' to 'pre-setup HOME'
    And I press 'Edit' button for 'testService' item
    And I edit service using the following data:
      | title          |
      | NewTestService |
    And I refresh the page
    Then I should see 2 'NewTestService' items on content management page

  Scenario: Referenced enquiry should change name after changing common enquiry's name

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I 'Reference' 'testEnquiry' to 'pre-setup HOME'
    And I press 'Edit' button for 'testEnquiry' item
    And I edit enquiry using the following data:
      | title          |
      | NewTestEnquiry |
    And I refresh the page
    Then I should see 2 'NewTestEnquiry' items on content management page



#  Scenario: Referenced items should be visible by guest
#Failed because https://basecamp.com/1773836/projects/5953306/todos/103736030
#    Given I am login to backend as staff
#    When I create new service using the following data:
#      | title             |
#      | reference Service |
#    And I 'Reference' 'reference Service' to 'Home'
#    And I press 'Preview' button
#    Then I should see 2 'New reference Service' items on content management page
