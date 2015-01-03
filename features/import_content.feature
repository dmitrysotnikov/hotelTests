Feature: Import Content

  Scenario: Guest should be able to import free vendor item
    Given I am login to backend as staff
    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I click ['Import'] button at content page
    And I press on 'pre-setup vendoralex' item from list
    And I 'Import' 'pre-setup test_vendor_alex' to 'testFolder'
    And I am on login staff page
    And I open [Content Manager] page
    And I press on 'testFolder' item from list
    Then I should see 'pre-setup test_vendor_alex' item on content management page