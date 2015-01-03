Feature: Email

  Background:
    Given I am on login visitor page

  Scenario: Should be possible to confirm create new guest account email notification

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    When I open verification link
    Then I should see 'Your account was successfully confirmed. You are now signed in.' notice
    When I press 'Logout' button
    And I login as 'user_guest' user with 'test12345' password
    Then I should see 'first last' user name on the visitor page


  Scenario: Should be possible to confirm order request in email notification

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Logout' button
    And I clear all cookies
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    And I search 'pre-setup Transportation' item
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    Then I should see 'Taxi from Airport' service form with 'Price: $70.00'
    When I add service to order
    And I place service order from cart
    And I should get email to mailbox with 'NEW REQUEST: Taxi from Airport' subject and 'Confirm' link
    And I open verification link
    Then I should see 'Confirmed' action for request


  Scenario: Should be possible to reject order request in email notification

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Logout' button
    And I clear all cookies
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    And I search 'pre-setup Transportation' item
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    And I should get email to mailbox with 'NEW REQUEST: Taxi from Airport' subject and 'Decline' link
    And I open verification link
    Then I should see 'Not available' action for request


  Scenario: Should be possible to handle order request in email notification

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Logout' button
    And I clear all cookies
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    And I search 'pre-setup Transportation' item
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    And I should get email to mailbox with 'NEW REQUEST: Taxi from Airport' subject and 'Handle' link
    And I open verification link
    Then I should see 'Processing' action for request


  Scenario: Should be possible to confirm create new guest account email notification after changing email address

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I press 'Settings' button
    And I change email field with 'user_guest2' value
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    Then I should see 'Your account was successfully confirmed. You are now signed in.' notice
    When I press 'Logout' button
    And I login as 'user_guest' user with 'test12345' password
    Then I should not see ['Request'] button
    When I login as 'user_guest2' user with 'test12345' password
    Then I should see 'first last' user name on the visitor page


  Scenario: Should not be possible to confirm create new guest account email notification two times

    And I delete all previous emails
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    Then I should see 'Your account was successfully confirmed. You are now signed in.' notice
    When I open verification link
    Then I should see 'Resend confirmation instructions' page


  Scenario: Should not be possible to confirm guest using old account email notification

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I press 'Settings' button
    And I change email field with 'user_guest2' value
    When I open verification link
    Then I should see 'Resend confirmation instructions' page


  Scenario: Guest should be able to receive email notifications when hotel or vendor staff confirm orders

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Logout' button
    And I clear all cookies
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    And I search 'pre-setup Transportation' item
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    Then I should get email to mailbox with 'NEW REQUEST: Taxi from Airport' subject and 'Confirm' link
    When I open verification link
    Then I should get email to mailbox with 'Hotelcloud Request Confirmed | Taxi from Airport at testalex' subject and 'View item: Taxi from Airport' link


  Scenario: Guest should not be able to receive email notifications when hotel or vendor staff confirm orders with disabled option

    When I delete all previous emails
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Settings' button
    And I press 'Receive notifications' button
    And I press 'Save' button
    And I press 'Logout' button
    And I clear all cookies
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    And I search 'pre-setup Transportation' item
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    Then I should get email to mailbox with 'NEW REQUEST: Taxi from Airport' subject and 'Confirm' link
    When I open verification link
    Then I should not get email to mailbox with 'Hotelcloud Request Confirmed | Taxi from Airport at testalex' subject and 'View item:' link
