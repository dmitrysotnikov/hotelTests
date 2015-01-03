Feature: Preview

  Background:
    Given I am login to backend as staff

  Scenario: Preview button should work for root folder

    When I press 'Content' button in the header
    And I click ['Preview'] button at content page
    Then I should see ['Home'] button


  Scenario: Preview button should work for any folder

    When I press 'Content' button in the header
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I click ['Preview'] button at content page
    Then I should see 'testFolder' breadcrumb
