Feature: Login

#  Disabled due to API issue
#  Scenario: Login as newly created user using api
#    Given I am on login visitor page
#    When I login as newly created user with following data:
#    | first_name |  last_name |     email      |
#    |   first    |     last   |   user_guest   |
#    Then I should see 'first last' user name on the visitor page


  Scenario: Guest user should be able to login

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I login as 'user_guest' user with 'test12345' password
    Then I should see 'first last' user name on the visitor page
    And I should see 'random' room on the visitor page


  Scenario: Guest user should be able to cancel login

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Cancel'] button at [Login] page
    Then I should see ['Login'] button


  Scenario: Guest user should be able to login using Facebook

    Given I am on login visitor page
    And I click ['Facebook'] button at [Login] page
    And I fill 'Facebook' login form using 'bobhike777@gmail.com' email and 'Great123' password
    Then I should see 'pre-setup Bob Hike' user name on the visitor page


  Scenario: Guest user should be able to login using Google+

    Given I am on login visitor page
    And I click ['Google'] button at [Login] page
    And I fill 'Google' login form using 'alexhoteltest@gmail.com' email and 'Great123' password
    Then I should see 'pre-setup Hotel Test' user name on the visitor page


  Scenario: Guest user should be able to login using Linkedin

    Given I am on login visitor page
    And I click ['Linkedin'] button at [Login] page
    And I fill 'Linkedin' login form using 'rickspoon777@gmail.com' email and 'Great123' password
    Then I should see 'pre-setup Rick Spoon' user name on the visitor page


  Scenario: Guest user should be able to login using Foursquare

    Given I am on login visitor page
    And I click ['Foursquare'] button at [Login] page
    And I fill 'Foursquare' login form using 'jackhi777@gmail.com' email and 'Great123' password
    Then I should see 'pre-setup Jack Hi' user name on the visitor page


  Scenario: Guest user should not be able to login with empty fields

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I fill login form using 'pre-setup ' email and '' password
    And I click ['Login'] button at [Login] page
    Then I should not see ['Request'] button
    When I fill login form using 'user_guest' email and '' password
    And I click ['Login'] button at [Login] page
    Then I should not see ['Request'] button
    When I fill login form using '' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should not see ['Request'] button
    When I fill login form using 'user_guest' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see visitor home page


  Scenario: Guest user should not be able to login with incorrect email address

    Given I am on login visitor page
    When I fill login form using 'pre-setup test@email.com' email and 'test12345' password
    And I click ['Login'] button at [Login] page
    Then I should see 'invalid email or password' error message


  Scenario: Guest user should not be able to login with incorrect password

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I fill login form using 'user_guest' email and 'test54321' password
    And I click ['Login'] button at [Login] page
    Then I should see 'invalid email or password' error message