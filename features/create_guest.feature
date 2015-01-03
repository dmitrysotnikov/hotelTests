Feature: Create guest


  Scenario Outline: Staff manager should be able to create new quest

    Given I am login to backend as staff
    When I create new guest account using the following details:
      | last_name      | <last_name>        |
      | room           | random             |
      | check_in_date  | <check_in_date>    |
      | check_out_date | <check_out_date>   |
      | check_in_time  | <check_in_time>    |
      | check_out_time | <check_out_time>   |
    Then I should see new guest with the following details:
      | last_name      | <last_name>       |
      | room           | random            |
      | check_in_date  | <check_in_date>   |
      | check_out_date | <check_out_date>  |
      | check_in_time  | <check_in_time>   |
      | check_out_time | <check_out_time>  |
      | status         | registered        |

  Examples:
    | last_name | check_in_date   | check_out_date | check_in_time | check_out_time |
    | User      | today+2         | today+10       |     1:20pm   |     2:45am    |


  Scenario Outline: Staff manager should be able to edit quest

    Given I am login to backend as staff
    When I create new guest account using the following details:
      | last_name      | <last_name>  |
      | room           | random       |
      | check_in_date  | <check_in_date>    |
      | check_out_date | <check_out_date>   |
      | check_in_time  | <check_in_time>    |
      | check_out_time | <check_out_time>   |
    And I press on the '<last_name>' guest with 'registered' status
    And I edit guest account using the following details:
      | last_name      | <new_last_name>      |
      | room           | random               |
      | check_in_date  | <new_check_in_date>  |
      | check_out_date | <new_check_out_date> |
      | check_in_time  | <new_check_in_time>  |
      | check_out_time | <new_check_out_time> |
    And I refresh the page
    Then I should see new guest with the following details:
      | last_name      | <new_last_name>       |
      | room           | random                |
      | check_in_date  | <new_check_in_date>   |
      | check_out_date | <new_check_out_date>  |
      | check_in_time  | <new_check_in_time>   |
      | check_out_time | <new_check_out_time>  |
      | status         | registered        |

  Examples:
    | last_name | check_in_date  | check_out_date |check_in_time | check_out_time | new_last_name | new_check_in_date   |  new_check_out_date   |new_check_in_time | new_check_out_time |
    | User      | today          | today+7        |    2:20pm    |      3:30am    | NewUser       |        today+1      |       today+8         |       5:20pm     |        5:30am      |


  Scenario: Visitor should be able Place order

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open 'Transportation' folder
    And I select 'Taxi from Airport' service
    Then I should see 'Taxi from Airport' service form with 'Price: $70.00'
    When I add service to order
    And I place service order from cart
    Then I should see 'Order On Hold' on Thank You pop up


  Scenario: Visitor should be able to set aside choosing room
  #Bug https://hotelcloud.atlassian.net/browse/HC-2586
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    Then I should see 'Click to enter your room number >' link
    When I press 'Click to enter your room number >' link
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'random' room on the visitor page


  Scenario: New guest registration

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'random' room on the visitor page
    And I should see 'first last' user name on the visitor page
    When I press 'Logout' button
    And I login as 'user_guest' user with 'test12345' password
    And I press 'Yes' button on your information popup
    Then I should see 'first last' user name on the visitor page
    And I should see 'random' room on the visitor page


  Scenario: New guest registration without first name of guest

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | last_name | email       | password  | password_confirmation |
      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'random' room on the visitor page
    And I should see 'last' user name on the visitor page
    When I press 'Logout' button
    And I login as 'user_guest' user with 'test12345' password
    And I press 'Yes' button on your information popup
    Then I should see 'last' user name on the visitor page
    And I should see 'random' room on the visitor page


  Scenario: Visitor should not see the room if room was filled but 'I don't have a room' option was selected
  #Bug https://hotelcloud.atlassian.net/browse/HC-2586
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I select 'I dont have a room' radiobutton
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    Then I should see 'Click to enter your room number >' link


  Scenario: Visitor should not see the link for entering the room number if he was registered with room

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    Then I should not see choose room link


  Scenario: Visitor should not be able to register with the same room number

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last2     | user_guest2 | test12345 | test12345             |
    And I fill the same room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'same room' error message


  Scenario: Visitor should be able to register with the same room number if staff wasn't confirmed request

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name  | last_name | email       | password  | password_confirmation |
      | first2      | last2     | user_guest2 | test12345 | test12345             |
    And I fill the same room number
    And I press 'Register my stay' button on your information popup
    Then I should see 'first2 last2' user name on the visitor page
    And I should see 'random' room on the visitor page


  Scenario: New guest registration with the existing email

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first2     | last2     | user_guest  | test12345 | test12345             |
    Then I should see 'existing email' error message


  Scenario: New guest registration with the invalid email

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email                      | password | password_confirmation |
      | first      | last      | pre-setup user_guest@gmail | test1234 | test1234              |
    Then I should see 'invalid email' error message


  Scenario: New guest registration with the short password

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password | password_confirmation |
      | first      | last      | user_guest  | test     | test                  |
    Then I should see 'short password' error message


  Scenario: New guest registration with doesn't match password confirmation

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password | password_confirmation |
      | first      | last      | user_guest  | test123  | test1234              |
    Then I should see 'doesn't match password' error message


  Scenario: New guest registration with short+doesn't match password confirmation

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password | password_confirmation |
      | first      | last      | user_guest  | test     | test1234              |
    Then I should see 'short + doesn't match password' error message


  Scenario: New guest registration with check-in and check-out date in past
  # https://basecamp.com/1773836/projects/5953306/todos/118958126
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password | password_confirmation |
      | first      | last      | user_guest | test1234 | test1234              |
    And I select 'I am a guest' radiobutton
    And I fill room and dates info using the following data:
      | room   | check_in | check_out |
      | random | yesterday | yesterday |
    And I press 'Register my stay' button on your information popup


  Scenario: New guest registration with check-out date before check-in
  # https://basecamp.com/1773836/projects/5953306/todos/118959047
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password | password_confirmation |
      | first      | last      | user_guest | test1234 | test1234              |
    And I fill room and dates info using the following data:
      | room   | check_in | check_out |
      | random | tomorrow | yesterday |
    And I press 'Register my stay' button on your information popup
    Then I should not see visitor home page


  Scenario: Guest user should not be able to register with empty fields

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name |
      | first      |
    Then I should not see ['Register my Stay'] button
    When I fill your information popup with following data:
      | first_name | last_name |
      | first      | last      |
    Then I should not see ['Register my Stay'] button
    When I fill your information popup with following data:
      | first_name | last_name | email      |
      | first      | last      | user_guest |
    Then I should not see ['Register my Stay'] button
    When I fill your information popup with following data:
      | first_name | last_name | email      | password |
      | first      | last      | user_guest | test1234 |
    Then I should not see ['Register my Stay'] button
    When I fill your information popup with following data:
      | first_name | last_name | email      | password | password_confirmation |
      | first      | last      | user_guest | test1234 | test1234              |
    Then I should see ['Register my Stay'] button


  Scenario: Guest user should not be able to register with empty room value
  #Bug https://hotelcloud.atlassian.net/browse/HC-2586
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password | password_confirmation |
      | first      | last      | user_guest | test1234 | test1234              |
    And I fill '' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    Then I should see 'Click to enter your room number >' link