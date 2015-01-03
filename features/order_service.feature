Feature: Order Service


  Scenario: Admin should be able to manage request on request manager page

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup Taxi from Airport' item
    And I select 'Taxi from Airport' service
    Then I should see 'Taxi from Airport' service form with 'Price: $70.00'
    When I add service to order
    And I place service order from cart
    And I should see 'Order On Hold' on Thank You pop up
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I press 'yes' for 'Show All' checkbox
    Then I should see 'Auto-registration' request with 'Archived' status
    When I 'Handle this request' 'Taxi from Airport' request with 'Pending' status on the requests list
    And I 'Confirm service' 'Taxi from Airport' request with 'Processing' status on the requests list
    Then I should see 'Taxi from Airport' request with 'Confirmed' status


  Scenario: Confirm user request
         #Failed https://hotelcloud.atlassian.net/browse/HC-2702
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Guests' button in the header
    And I 'checked' 'Check Out' checkbox
    Then I should see 'last' guest with 'pending' status
    When I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for request


  Scenario: Reject user request
  #Failed https://hotelcloud.atlassian.net/browse/HC-2702
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Guests' button in the header
    And I 'checked' 'Check Out' checkbox
    Then I should see 'last' guest with 'pending' status
    When I press 'Requests' button in the header
    And I 'Reject' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'NOT AVAILABLE' status for request


  Scenario: Admin should be able to confirm, and checkout user's request.
  #Bug https://basecamp.com/1773836/projects/5953306/todos/112058362
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I press 'Guests' button in the header
    And I 'checked' 'Check Out' checkbox
    And I press on the 'last' guest with 'registered' status
    And I press 'Checkout' button for guest
    Then I should see 'last' guest with 'checked out' status

  Scenario: Admin should be able to handle request on request manager page

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup Taxi from Airport' item
    And I select 'Taxi from Airport' service
    Then I should see 'Taxi from Airport' service form with 'Price: $70.00'
    When I add service to order
    And I place service order from cart
    And I should see 'Order On Hold' on Thank You pop up
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I 'Handle this request' 'Taxi from Airport' request with 'Pending' status on the requests list
    Then I should see 'Taxi from Airport' request with 'Processing' status


  Scenario: "Checked Out" guest should not be able to place orders
  #Failed https://hotelcloud.atlassian.net/browse/HC-2702
   Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
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
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I 'Handle this request' 'Taxi from Airport' request with 'Pending' status on the requests list
    And I 'Confirm service' 'Taxi from Airport' request with 'Processing' status on the requests list
    And I press 'Guests' button in the header
    And I press on the 'last' guest with 'registered' status
    And I press 'Checkout' button for guest
    And I 'checked' 'Check Out' checkbox
    Then I should see 'last' guest with 'checked out' status
    When I login as 'user_guest' user with 'test12345' password
    And I press 'Home' button
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    And I add service to order
    And I place service order from cart
    Then I should see disabled [Place Order] button

  Scenario: User should be able to change order's date

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup Taxi from Airport' item
    And I select 'Taxi from Airport' service
    And I add service to order
    And select '30' from calendar
    And I place service order from cart
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: User should be able to place order from folder with cart

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart  |
      | testFolder |   checked      |
    And I press on 'testFolder' item from list
    And I add new section with the following data:
      | name        |
      | testSection |
    And I create new service using the following data:
      | title       |  price |
      | testService |  20    |
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open 'testFolder' created item
    And I open 'testService' created item
    And I select '30' day from calender and place order from folder with section
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Registered guest with room should be able to order service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    And I press 'Home' button
    And I select 'testService' service
    And I place service order
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Registered guest without room should be able to order service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'I dont have a room' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    And I click ['No'] button at [Do you have a room] section
    And I press 'Home' button
    And I select 'testService' service
    And I place service order
    And I press 'I dont have a room' button on your information popup
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Not logged in guest shouldn't be able to order service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I click ['Preview'] button at content page
    And I select 'testService' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    And I place service order
    Then I should see 'Order On Hold' on Thank You pop up

  Scenario: Not registered guest shouldn't be able to order service
  # Bug https://basecamp.com/1773836/projects/5953306/todos/117019490
    Given I am login to backend as staff
    And I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I click ['Preview'] button at content page
    And I select 'test Service' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I select 'testService' service
    And I place service order
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Registered guest with room should be able to order service using shopping cart

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    And I press 'Home' button
    And I open 'testFolder' created item
    And I select 'testService' service
    And I add service to order
    And I place service order from cart
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Registered guest without room shouldn't be able to order service using shopping cart
  # Bug https://basecamp.com/1773836/projects/5953306/todos/117019490
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'I dont have a room' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testSection' item from list
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    And I click ['No'] button at [Do you have a room] section
    And I press 'Home' button
    And I open 'testFolder' created item
    And I select 'testService' service
    And I add service to order
    And I place service order from cart
    And I press 'I dont have a room' button on your information popup
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Not logged in guest shouldn't be able to order service using shopping cart

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I click ['Preview'] button at content page
    And I open 'testFolder' created item
    And I select 'testService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Not registered guest shouldn't be able to order service using shopping cart
    Given I am login to backend as staff
    And I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint    | image               | price | enable_quantity | description |
      | testService | test it | funny-animals-2.jpg | 200   | yes             | Wow         |
    And I click ['Preview'] button at content page
    And I select 'testService' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I wait 3 seconds
    And I select 'testService' service
    And I place service order
    Then I should see 'Order On Hold' on Thank You pop up

    
  Scenario: Confirm user request with changing room number
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm and change room' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    Then I should see 'random+1' room on the visitor page


  Scenario: Not logged in guest with room should be able to place order for no price service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'NoPriceFolderService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceFolderService' request

  Scenario: Not logged in guest without room should be able to place order for no price service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'NoPriceFolderService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceFolderService' request

  Scenario: Logged in guest with room should be able to place order for no price service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'NoPriceFolderService' service
    And I add service to order
    And I place service order from cart
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceFolderService' request


  Scenario: Logged in guest without room should be able to place order for no price service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'NoPriceFolderService' service
    And I add service to order
    And I place service order from cart
#    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceFolderService' request

  Scenario: Not registered guest should be able to place order for no price service using the card with selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'NoPriceFolderService' service
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceFolderService' request

  Scenario: Not registered guest should be able to place order for no price service using the card without selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'NoPriceFolderService' service
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
    Then I should see 'PENDING' status for 'NoPriceFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceFolderService' request


  Scenario: Not logged in guest with room should be able to place order for no price service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I search 'pre-setup NoPriceService' item
    And I select 'NoPriceService' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceService' request

  Scenario: Not logged in guest without room should be able to place order for no price service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I search 'pre-setup NoPriceService' item
    And I select 'NoPriceService' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceService' request

  Scenario: Logged in guest with room should be able to place order for no price service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup NoPriceService' item
    And I select 'NoPriceService' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceService' request

  Scenario: Logged in guest without room should be able to place order for no price service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup NoPriceService' item
    And I select 'NoPriceService' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceService' request

  Scenario: Not registered guest should be able to place order for no price service with selecting the room number

    Given I navigate to visitor page
    And I search 'pre-setup NoPriceService' item
    And I select 'NoPriceService' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceService' request

  Scenario: Not registered guest should be able to place order for no price service without selecting the room numberGiven I navigate to visitor page

    Given I navigate to visitor page
    And I search 'pre-setup NoPriceService' item
    And I select 'NoPriceService' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'NoPriceService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'NoPriceService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'NoPriceService' request with 'Processing' status on the requests list
    Then As vendor I should see 'NoPriceService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'NoPriceService' request



  Scenario: Not logged in guest with room should be able to place order for by quote service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I search 'pre-setup ByQuoteService' item
    And I select 'ByQuoteService' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteService' request

  Scenario: Not logged in guest without room should be able to place order for by quote service
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I search 'pre-setup ByQuoteService' item
    And I select 'ByQuoteService' service
    And I place service order
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteService' request

  Scenario: Logged in guest with room should be able to place order for by quote service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup ByQuoteService' item
    And I select 'ByQuoteService' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteService' request

  Scenario: Logged in guest without room should be able to place order for by quote service

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I search 'pre-setup ByQuoteService' item
    And I select 'ByQuoteService' service
    And I place service order
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteService' request

  Scenario: Not registered guest should be able to place order for by quote service with selecting the room number

    Given I navigate to visitor page
    And I search 'pre-setup ByQuoteService' item
    And I select 'ByQuoteService' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteService' request

  Scenario: Not registered guest should be able to place order for by quote service without selecting the room number

    Given I navigate to visitor page
    And I search 'pre-setup ByQuoteService' item
    And I select 'ByQuoteService' service
    And I place service order
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteService' request



  Scenario: Not logged in guest with room should be able to place order for by quote service using the card
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'ByQuoteFolderService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteFolderService' request

  Scenario: Not logged in guest without room should be able to place order for by quote service using the card
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I open 'cart_vendor_alex' folder
    And I select 'ByQuoteFolderService' service
    And I add service to order
    And I place service order from cart
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteFolderService' request

  Scenario: Logged in guest with room should be able to place order for by quote service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'ByQuoteFolderService' service
    And I add service to order
    And I place service order from cart
  #    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteFolderService' request

  Scenario: Logged in guest without room should be able to place order for by quote service using the card

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I open 'cart_vendor_alex' folder
    And I select 'ByQuoteFolderService' service
    And I add service to order
    And I place service order from cart
  #    And I save payment info
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteFolderService' request

  Scenario: Not registered guest should be able to place order for by quote service using the card with selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'ByQuoteFolderService' service
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
    Then I should see 'PENDING' status for 'ByQuoteFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteFolderService' request

  Scenario: Not registered guest should be able to place order for by quote service using the card without selecting the room number

    Given I navigate to visitor page
    And I open 'cart_vendor_alex' folder
    And I select 'ByQuoteFolderService' service
    And I add service to order
    And I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    Then I should see 'Order Placed' on Thank You pop up
    When I press 'Track order' button in the [Thank you] pop up
    Then I should see 'PENDING' status for 'ByQuoteFolderService' request
    When I am login to backend as vendor
    And I press 'Requests' button in the header
    And As vendor I 'Handle this request' 'ByQuoteFolderService' request with 'Pending' status on the requests list
    And As vendor I 'Confirm service' 'ByQuoteFolderService' request with 'Processing' status on the requests list
    Then As vendor I should see 'ByQuoteFolderService' request with 'Confirmed' status
    When I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for 'ByQuoteFolderService' request



