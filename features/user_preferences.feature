Feature: User Preferences


  Scenario Outline: Staff Manager should be able to change own password

    Given I delete all previous emails
    And I am login to backend as staff
    When I press 'Staff' button in the header
    And I create new staff member account using the following details:
      | first_name      | <first_name> |
      | last_name       | <last_name>  |
      | phone           | <phone>      |
      | email           | <email>      |
      | password        | <password>   |
      | <staff_manager> | yes          |
    And I logout from staff account
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm my account' link
    And I open verification link
    And I am login to backend as '<email>' with '<password>' password
    And I press '<button>' button in the header
    And I change '<password>' to '<new_password>'
    And I logout from staff account
    And I am login to backend as '<email>' with '<new_password>' password
    Then I should see 'New Staff' button on the page

  Examples:
    | first_name | last_name | email   | phone   | staff_manager   | password  | new_password | button      |
    | Staff      | Manager   | staff   | 1234567 | staff_manager   | test12345 | test54321    | Preferences |


  Scenario Outline: Service Manager should be able to change own password

    Given I delete all previous emails
    And I am login to backend as staff
    When I press 'Staff' button in the header
    And I create new staff member account using the following details:
      | first_name      | <first_name> |
      | last_name       | <last_name>  |
      | phone           | <phone>      |
      | email           | <email>      |
      | password        | <password>   |
      | <staff_manager> | yes          |
    And I logout from staff account
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm my account' link
    And I open verification link
    And I am login to backend as '<email>' with '<password>' password
    And I press '<button>' button in the header
    And I change '<password>' to '<new_password>'
    And I logout from staff account
    And I am login to backend as '<email>' with '<new_password>' password
    Then I should see ['New Guest'] button on the page

  Examples:
    | first_name | last_name | email   | phone   | staff_manager   | password  | new_password | button      |
    | Service    | Manager   | service | 1234567 | service_manager | test12345 | test54321    | Preferences |


  Scenario Outline: Manager should be able to change own password

    Given I delete all previous emails
    And I am login to backend as staff
    When I press 'Staff' button in the header
    And I create new staff member account using the following details:
      | first_name      | <first_name> |
      | last_name       | <last_name>  |
      | phone           | <phone>      |
      | email           | <email>      |
      | password        | <password>   |
      | <staff_manager> | yes          |
    And I logout from staff account
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm my account' link
    And I open verification link
    And I am login to backend as '<email>' with '<password>' password
    And I press '<button>' button in the header
    And I change '<password>' to '<new_password>'
    And I logout from staff account
    And I am login to backend as '<email>' with '<new_password>' password
    Then I should see ['New Guest'] button on the page

  Examples:
    | first_name | last_name | email   | phone   | staff_manager   | password  | new_password | button      |
    | Request    | Manager   | request | 1234567 | request_manager | test12345 | test54321    | Preferences |


  Scenario: User should get email about butler request

    Given I delete all previous emails
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'checked' 'Butler requests' checkbox
    And I press 'Save Preference' button on preference page
    And I press 'Hotel Settings' button in the header
    And I make 'checked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Butler' button
    And I confirm my butler
#    Then I should see 'Order On Hold' on Thank You pop up
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    Then I should get email to mailbox with 'New Request: Butler' subject and 'Confirm' link
    And I open verification link
    Then I should see 'Request Confirmed: Butler' notification
    When I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I login as 'user_guest' user with 'test12345' password
    Then I should not see ['Butler'] button
    When I clear all cookies


  Scenario: User should not get email about butler request

    Given I delete all previous emails
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'unchecked' 'Butler requests' checkbox
    And I press 'Save Preference' button on preference page
    And I press 'Hotel Settings' button in the header
    And I make 'checked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Butler' button
    And I confirm my butler
#    Then I should see 'Order On Hold' on Thank You pop up
    When I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    Then I should not get email to mailbox with 'New Request: Butler' subject and 'Confirm' link
    When I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I login as 'user_guest' user with 'test12345' password
    Then I should not see ['Butler'] button
    When I clear all cookies


  Scenario: User should get email about auto request

    Given I delete all previous emails
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'checked' 'Auto request' checkbox
    And I press 'Save Preference' button on preference page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should get email to mailbox with 'New Request: Auto-registration' subject and 'Confirm' link
    When I open verification link
    Then I should see 'Request Confirmed: Auto-registration' notification
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'unchecked' 'Auto request' checkbox
    And I press 'Save Preference' button on preference page
    And I clear all cookies


  Scenario: User should not get email about auto request when checkbox unchecked

    Given I delete all previous emails
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'unchecked' 'Auto request' checkbox
    And I press 'Save Preference' button on preference page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should not get email to mailbox with 'New Request: Auto-registration' subject and 'Confirm' link
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'unchecked' 'Auto request' checkbox
    And I press 'Save Preference' button on preference page
    And I clear all cookies


  Scenario: User should get email about service confirming

    Given I delete all previous emails
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'checked' 'Transportation' checkbox
    And I press 'Save Preference' button on preference page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup Taxi from Airport' item
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    And I should see 'Order On Hold' on Thank You pop up
    When I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    Then I should get email to mailbox with 'New Request: Taxi from Airport' subject and 'Confirm' link
    When I open verification link
    Then I should see 'Request Confirmed: Transportation' notification


  Scenario: User should not get email about service confirming with disabled checkbox

    Given I delete all previous emails
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'unchecked' 'Transportation' checkbox
    And I press 'Save Preference' button on preference page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup Taxi from Airport' item
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    And I should see 'Order On Hold' on Thank You pop up
    When I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    Then I should not get email to mailbox with 'New Request: Taxi from Airport' subject and 'Confirm' link
    When I am login to backend as staff
    And I press 'Preference' button in the header
    And I make 'checked' 'Transportation' checkbox
    And I press 'Save Preference' button on preference page
    And I clear all cookies