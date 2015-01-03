Feature: Vendor Order Service


  Scenario: Guest should be able to order free vendor item
    Given I delete all previous emails
    And I am login to backend as staff
    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I click ['Import'] button at content page
    And I press on 'pre-setup David Local Activities' item from list
    And I wait 3 seconds
    And I press on 'pre-setup Local Activities' item from list
    And I 'Import' 'pre-setup Free Vendor Item' to 'testFolder'
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I open 'testFolder' created item
    And I select 'Free Vendor Item' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    And I should get email to mailbox with 'Hotelcloud Request Pending | Free Vendor Item at David Local Activities' subject and 'Free Vendor Item' link


  Scenario: Not logged in guest with room should be able to order vendor service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I select 'test_vendor_alex' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Request' button
    Then I should see 'PENDING' status for 'test_vendor_alex' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'test_vendor_alex' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'test_vendor_alex' request with 'Processing' status on the requests list
    Then As vendor I should see 'test_vendor_alex' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'test_vendor_alex' request


  Scenario: Not logged in guest without room should be able to order vendor service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I select 'test_vendor_alex' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Request' button
    Then I should see 'PENDING' status for 'test_vendor_alex' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'test_vendor_alex' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'test_vendor_alex' request with 'Processing' status on the requests list
    Then As vendor I should see 'test_vendor_alex' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'test_vendor_alex' request


  Scenario: Logged in guest with room should be able to order vendor service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I select 'test_vendor_alex' service
    And I place service order
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Request' button
    Then I should see 'PENDING' status for 'test_vendor_alex' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'test_vendor_alex' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'test_vendor_alex' request with 'Processing' status on the requests list
    Then As vendor I should see 'test_vendor_alex' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'test_vendor_alex' request


  Scenario: Logged in guest without room should be able to order vendor service
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I select 'test_vendor_alex' service
    And I place service order
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Request' button
    Then I should see 'PENDING' status for 'test_vendor_alex' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'test_vendor_alex' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'test_vendor_alex' request with 'Processing' status on the requests list
    Then As vendor I should see 'test_vendor_alex' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'test_vendor_alex' request


  Scenario: Not registered guest should be able to order vendor service without selecting the room number

    Given I navigate to visitor page
    When I select 'test_vendor_alex' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Request' button
    Then I should see 'PENDING' status for 'test_vendor_alex' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'test_vendor_alex' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'test_vendor_alex' request with 'Processing' status on the requests list
    Then As vendor I should see 'test_vendor_alex' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'test_vendor_alex' request


  Scenario: Not registered guest should be able to order vendor service with selecting the room number

    Given I navigate to visitor page
    And I select 'test_vendor_alex' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Request' button
    Then I should see 'PENDING' status for 'test_vendor_alex' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'test_vendor_alex' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'test_vendor_alex' request with 'Processing' status on the requests list
    Then As vendor I should see 'test_vendor_alex' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'test_vendor_alex' request




  Scenario: Not logged in guest with room should be able to place order of vendor service using the cart

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'vendor_service' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'vendor_service' request


  Scenario: Not logged in guest without room should be able to place order of vendor service using the cart

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'vendor_service' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'vendor_service' request


  Scenario: Logged in guest with room should be able to place order of vendor service using the cart

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'vendor_service' service
    And I add service to order
    And I place service order from cart
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'vendor_service' request


  Scenario: Logged in guest without room should be able to place order of vendor service using the cart

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'vendor_service' service
    And I add service to order
    And I place service order from cart
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'vendor_service' request


  Scenario: Not registered guest should be able to place order of vendor service using the cart without selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'vendor_service' service
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
#    And I save payment info
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'vendor_service' request


  Scenario: Not registered guest should be able to place order of vendor service using the cart with selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'vendor_service' service
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
#    And I save payment info
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'vendor_service' request




  Scenario: Not logged in guest with room should be able to order free vendor service
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I select 'free_vendor_service' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'free_vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'free_vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'free_vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'free_vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'free_vendor_service' request


  Scenario: Not logged in guest without room should be able to order free vendor service
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I select 'free_vendor_service' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'free_vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'free_vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'free_vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'free_vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'free_vendor_service' request


  Scenario: Logged in guest with room should be able to order free vendor service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I select 'free_vendor_service' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'free_vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'free_vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'free_vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'free_vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'free_vendor_service' request


  Scenario: Logged in guest without room should be able to order free vendor service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I select 'free_vendor_service' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'free_vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'free_vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'free_vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'free_vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'free_vendor_service' request


  Scenario: Not registered guest should be able to order free vendor service without selecting the room number

    Given I navigate to visitor page
    And I select 'free_vendor_service' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'free_vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'free_vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'free_vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'free_vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'free_vendor_service' request


  Scenario: Not registered guest should be able to order free vendor service with selecting the room number

    Given I navigate to visitor page
    And I select 'free_vendor_service' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'free_vendor_service' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'free_vendor_service' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'free_vendor_service' request with 'Processing' status on the requests list
    Then As vendor I should see 'free_vendor_service' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'free_vendor_service' request



  Scenario: Not logged in guest with room should be able to place order for free vendor service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'FreeVendorFolderService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'FreeVendorFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'FreeVendorFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'FreeVendorFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'FreeVendorFolderService' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'FreeVendorFolderService' request


  Scenario: Not logged in guest without room should be able to place order for free vendor service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'FreeVendorFolderService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'FreeVendorFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'FreeVendorFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'FreeVendorFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'FreeVendorFolderService' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'FreeVendorFolderService' request


  Scenario: Logged in guest with room should be able to place order for free vendor service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'FreeVendorFolderService' service
    And I add service to order
    And I place service order from cart
    Then I should see 'Order Placed' on Thank You pop up
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'FreeVendorFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'FreeVendorFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'FreeVendorFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'FreeVendorFolderService' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'FreeVendorFolderService' request


  Scenario: Logged in guest without room should be able to place order for free vendor service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'FreeVendorFolderService' service
    And I add service to order
    And I place service order from cart
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'FreeVendorFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'FreeVendorFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'FreeVendorFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'FreeVendorFolderService' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'FreeVendorFolderService' request


  Scenario: Not registered guest should be able to place order for free vendor service using the card without selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'FreeVendorFolderService' service
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'FreeVendorFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'FreeVendorFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'FreeVendorFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'FreeVendorFolderService' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'FreeVendorFolderService' request


  Scenario: Not registered guest should be able to place order for free vendor service using the card with selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'FreeVendorFolderService' service
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'FreeVendorFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'FreeVendorFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'FreeVendorFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'FreeVendorFolderService' request with 'Confirmed' status
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'FreeVendorFolderService' request
