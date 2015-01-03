Feature: Favorites

  Background:
    Given I am login to backend as staff
    And I open [Content Manager] page


  Scenario: Guest should be able to add folder to favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I open 'testFolder' created item
    And I add service to favorites
    And I press favorites button
    Then I should see 'testFolder' items on [Favorites] page


  Scenario: Guest without room should be able to add folder to favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I open 'testFolder' created item
    And I add service to favorites
    And I press favorites button
    Then I should see 'testFolder' items on [Favorites] page

  Scenario: Guest should be able to add service to favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    When I create new service using the following data:
      | title       |
      | testService |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testService' item
    And I open 'testService' created item
    And I add service to favorites
#    And I close folder
    And I press favorites button
    Then I should see 'testService' items on [Favorites] page

  Scenario: Guest should be able to add info to favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    When I create new info using the following data:
      | title    |
      | testInfo |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testInfo' item
    And I open 'testInfo' created item
    And I add service to favorites
    And I close folder
    And I press favorites button
    Then I should see 'testInfo' items on [Favorites] page


  Scenario: Guest should be able to add link to favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    When I create new link using the following data:
      | title    | hint      | description     | image               | url                    |
      | testLink | test Link | testDescription | funny-animals-2.jpg | http://www.google.com/ |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testLink' item
    And I open 'testLink' created item
    And I add service to favorites
    And I close folder
    And I press favorites button
    Then I should see 'testLink' items on [Favorites] page


  Scenario: Guest should be able to add enquiry to favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    When I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testEnquiry' item
    And I open 'testEnquiry' created item
    And I add service to favorites
    And I close folder
    And I press favorites button
    Then I should see 'testEnquiry' items on [Favorites] page


  Scenario: Guest should be able to unmark folder as favorites from home folder

    When I create new folder using the following data:
      | title       |
      | testFolder  |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should not see 'Favorites' button on guest page
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press favorites button
    Then I should see 'testFolder' items on [Favorites] page
    And I press 'Home' button
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I delete service from favorites
    Then I should not see 'Favorites' button on guest page
    And I press 'Settings' button
    And I should not see 'Remove Favorites' button on [Settings] page


  Scenario: Guest should be able to unmark service as favorites from favorites folder

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should not see 'Favorites' button on guest page
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press favorites button
    Then I should see 'testFolder' items on guest page
    And I select 'testFolder' service
    And I delete service from favorites
    Then I should not see 'Favorites' button on guest page
    And I press 'Settings' button
    And I should not see 'Remove Favorites' button on [Settings] page


  Scenario: Guest should be able to import favorites by code

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy code for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill 'correct' code for imported favorites
    And I confirm import
    And I press 'Cancel' button
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Guest should be able to import favorites by url

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I proceed to 'correct' imported favorites page
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Guest should not be able to import favorites by failed url

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I proceed to 'incorrect' imported favorites page
    Then I should not see 'Favorites' button on guest page
    And I press 'Settings' button
    And I should not see 'Remove Favorites' button on [Settings] page


  Scenario: Guest should not be able to import favorites by failed code

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy code for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill 'incorrect' code for imported favorites
    And I confirm import
    Then I should see 'Invalid Code' error message at [Settings] section


  Scenario: Unregistered user should be able to import favorites by url
  #Failed due to error
    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I proceed to 'correct' imported favorites page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Favorites items should be saved after re-login

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I login as 'user_guest' user with 'test12345' password
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Imported by code favorites items should be saved after re-login

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy code for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill 'correct' code for imported favorites
    And I confirm import
    And I press 'Cancel' button
    And I press favorites button
    And I should see 'testFolder' items on guest page
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I login as 'user_guest2' user with 'test12345' password
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Imported by url favorites items should be saved after re-login

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I proceed to 'correct' imported favorites page
    And I press favorites button
    And I should see 'testFolder' items on guest page
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I login as 'user_guest2' user with 'test12345' password
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Imported by url favorites items should be copied from first user

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I proceed to 'correct' imported favorites page
    And I press favorites button
    And I should see 'testFolder' items on guest page
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I login as 'user_guest' user with 'test12345' password
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Imported by code favorites items should be copied from first user

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy code for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill 'correct' code for imported favorites
    And I confirm import
    And I press 'Cancel' button
    And I press favorites button
    And I should see 'testFolder' items on guest page
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I login as 'user_guest' user with 'test12345' password
    And I press favorites button
    Then I should see 'testFolder' items on guest page

  Scenario: User should be able to remove favorites items from 'Settings' popup
    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I press 'Remove Favorites' button
    And I press 'Cancel' button
    And I press 'Home' button
    Then I should not see 'Favorites' button on guest page
    And I press 'Settings' button
    And I should not see 'Remove Favorites' button on [Settings] page


  Scenario: User should be able to remove imported by url favorites items from 'Settings' popup
    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I proceed to 'correct' imported favorites page
    And I press favorites button
    And I should see 'testFolder' items on guest page
    And I press 'Settings' button
    And I press 'Remove Favorites' button
    And I press 'Cancel' button
    Then I should not see 'Favorites' button on guest page
    And I press 'Settings' button
    And I should not see 'Remove Favorites' button on [Settings] page


  Scenario: User should be able to remove imported by code favorites items from 'Settings' popup
    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy code for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill 'correct' code for imported favorites
    And I confirm import
    And I press 'Cancel' button
    And I press favorites button
    And I should see 'testFolder' items on guest page
    And I press 'Settings' button
    And I press 'Remove Favorites' button
    And I press 'Cancel' button
    Then I should not see 'Favorites' button on guest page
    And I press 'Settings' button
    And I should not see 'Remove Favorites' button on [Settings] page


  Scenario: Guest without room should be able to import favorites by code

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy code for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill 'correct' code for imported favorites
    And I confirm import
    And I press 'Cancel' button
    And I press favorites button
    Then I should see 'testFolder' items on guest page


  Scenario: Guest without room should be able to import favorites by url

    When I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press 'Settings' button
    And I copy url for import favorites
    And I press 'Logout' button
    And I clear all cookies
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I proceed to 'correct' imported favorites page
    And I press favorites button
    Then I should see 'testFolder' items on guest page
