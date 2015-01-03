Feature: Create content on section

  Background:
    Given I am login to backend as staff


  Scenario: User should be able to create the service inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new service using the following data:
      | title       |
      | testService |
    Then I should see 'testService' item on content management page


  Scenario: User should be able to create the info inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page


  Scenario: User should be able to create the link inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new link using the following data:
      | title    | url                     |
      | testLink | https://www.google.com/ |
    Then I should see 'testLink' item on content management page


  Scenario: User should be able to create the enquiry inside the section

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    Then I should see 'testEnquiry' item on content management page


  Scenario: User should be able to create and place service with list view

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | list_view | shopping_cart |
      | testFolder | checked   | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new service using the following data:
      | title       |
      | testService |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'View options' button in folder
    When I press on 'View options' button from folder
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: User should be able to create info with list view

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | list_view | shopping_cart |
      | testFolder | checked   | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'More info' button in folder


  Scenario: User should be able to create enquiry with list view

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | list_view | shopping_cart |
      | testFolder | checked   | checked       |
    And I press on 'testFolder' item from list
    And I add new sections with the following data:
      | name        |
      | testSection |
    Then I should see 'testSection' section in the folder
    When I create new enquiry using the following data:
      | title    |
      | testEnquiry |
    Then I should see 'testEnquiry' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'Ask us a question' button in folder

