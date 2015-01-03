Feature: Folder section

  Background:
    Given I am login to backend as staff


  Scenario: User should be able to create the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder


  Scenario: User should be able to edit the title of section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    And I press 'Edit title' button from section
    And I fill 'NewTestSection' title to the field
    Then I should see 'NewTestSection' section in the folder


  Scenario: User should be able to delete the section
  # Failed due to https://hotelcloud.atlassian.net/browse/HC-2722
    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    And I press 'Delete' button from section
    Then I should not see 'testSection' section in the folder


  Scenario: User should be able to move sections

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name           |
      | first section  |
    And I wait 2 seconds
    And I add new sections with the following data:
      | name           |
      | second section |
    And I move 'first section' after 'second section'
    Then I should see 'second section' before 'first section'








