Feature: Forgot Password

  Scenario: Guest user should be able to reset password

    Given I delete all previous emails
    And I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Forgot Password'] button at [Login] page
    And I reset password for existing 'user_guest' user
    Then I should get email to mailbox with 'Reset password instructions' subject and 'Change my password' link
    And I open verification link
    And I change password to 'test54321' and confirmed password with 'test54321'
    Then I should see 'first last' user name on the visitor page
    And I should see 'random' room on the visitor page
    And I press 'Logout' button
    And I login as 'user_guest' user with 'test54321' password
    Then I should see 'first last' user name on the visitor page
    And I should see 'random' room on the visitor page


  Scenario: Guest user should not be able to reset password with wrong password confirmation

    Given I delete all previous emails
    And I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Forgot Password'] button at [Login] page
    And I reset password for existing 'user_guest' user
    Then I should get email to mailbox with 'Reset password instructions' subject and 'Change my password' link
    And I open verification link
    And I change password to 'test54321' and confirmed password with 'test111111'
    Then I should see 'Password doesn't match confirmation' notification on 'Password change' popup


  Scenario: Guest user should not be able to reset password for non existing user

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Forgot Password'] button at [Login] page
    And I reset password for non existing 'fail' user
    Then I should see 'not found' notification on 'Reset my password' popup


  Scenario: Guest user should not be able to reset password with short password

    Given I delete all previous emails
    And I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Forgot Password'] button at [Login] page
    And I reset password for existing 'user_guest' user
    Then I should get email to mailbox with 'Reset password instructions' subject and 'Change my password' link
    And I open verification link
    And I change password to 'test' and confirmed password with 'test'
    Then I should see 'Password is too short (minimum is 6 characters)' notification on 'Password change' popup

  Scenario: Guest user should not be able to reset password with empty password field

    Given I delete all previous emails
    And I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Forgot Password'] button at [Login] page
    And I reset password for existing 'user_guest' user
    Then I should get email to mailbox with 'Reset password instructions' subject and 'Change my password' link
    And I open verification link
    And I change password to '' and confirmed password with ''
    Then I should see 'Password can't be blank' notification on 'Password change' popup