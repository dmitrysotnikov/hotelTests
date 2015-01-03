Feature: Search

  Background:
    Given I am login to backend as staff

  Scenario: Guest should be able to search service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    Then I see 1 items on guest page
    And I should see 'testService' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    Then I should see 'testFolder' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testFolder' item
    Then I see 1 items on guest page
    And I should see 'testFolder' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search info

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testInfo' item
    Then I see 1 items on guest page
    And I should see 'testInfo' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     |
      | testLink | https://www.google.com/ |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    Then I see 1 items on guest page
    And I should see 'testLink' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    Then I should see 'testEnquiry' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testEnquiry' item
    Then I see 1 items on guest page
    And I should see 'testEnquiry' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to clear search

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    And I create new service using the following data:
      | title        |
      | testService2 |
    When I click ['Preview'] button at content page
    And I search 'testService' item
    Then I see 1 items on guest page
    And I should see 'testService' items on guest page
    When I clear search
    Then I should see 'testService2' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search folder inside the section

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
    When I click ['Preview'] button at content page
    And I search 'testService' item
    Then I see 1 items on guest page
    And I should see 'testService' items on guest page
    When I clear all cookies


  Scenario: User should be able to search the info inside the section

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
      | title    |
      | testInfo |
    When I click ['Preview'] button at content page
    And I search 'testInfo' item
    Then I see 1 items on guest page
    And I should see 'testInfo' items on guest page
    When I clear all cookies


  Scenario: User should be able to search the link inside the section

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
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    Then I see 1 items on guest page
    And I should see 'testLink' items on guest page
    When I clear all cookies


  Scenario: User should be able to search the enquiry inside the section

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
    When I click ['Preview'] button at content page
    And I search 'testEnquiry' item
    Then I see 1 items on guest page
    And I should see 'testEnquiry' items on guest page
    When I clear all cookies


  Scenario: User should be able to search the folder inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    And I create new folder using the following data:
      | title       |
      | testFolder2 |
    When I click ['Preview'] button at content page
    And I search 'testFolder2' item
    Then I see 1 items on guest page
    And I should see 'testFolder2' items on guest page
    When I clear all cookies


  Scenario: User should be able to search the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I click ['Preview'] button at content page
    And I search 'testSection' item
    Then I see 1 items on guest page
    And I should see 'testSection' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search service by hint

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint    |
      | testService | test it |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'test it' item
    Then I see 1 items on guest page
    And I should see 'testService' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search folder by hint

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | hint        |
      | testFolder | test folder |
    Then I should see 'testFolder' item on content management page
    When I click ['Preview'] button at content page
    And I search 'test folder' item
    Then I see 1 items on guest page
    And I should see 'testFolder' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search info by hint

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | hint      |
      | testInfo | test info |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    And I search 'test info' item
    Then I see 1 items on guest page
    And I should see 'testInfo' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search link by hint

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | hint      | url                     |
      | testLink | test Link | https://www.google.com/ |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'test Link' item
    Then I see 1 items on guest page
    And I should see 'testLink' items on guest page
    When I clear all cookies


  Scenario: Guest should be able to search enquiry by hint

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       | hint         |
      | testEnquiry | test Enquiry |
    Then I should see 'testEnquiry' item on content management page
    When I click ['Preview'] button at content page
    And I search 'test Enquiry' item
    Then I see 1 items on guest page
    And I should see 'testEnquiry' items on guest page
    When I clear all cookies