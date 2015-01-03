Feature: Account Settings


  Scenario: Guest should not be able to change email to invalid email

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I change email field with 'pre-setup test' value
    Then I should see 'invalid email' error message at [Settings] section
    When I change email field with 'pre-setup  ' value
    Then I should see 'empty email' error message at [Settings] section
    When I change email field with 'pre-setup test@gmail' value
    Then I should see 'invalid email' error message at [Settings] section


  Scenario: Guest should not be able to change email to existing user email

    Given I delete all previous emails
    And I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Logout' button
    And I press 'Login' button
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest2 | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I change email field with 'user_guest' value
    Then I should see 'existing email' error message at [Settings] section


  Scenario: Guest should be able to cancel changing email

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Settings' button
    And I fill email field with 'user_guest2' value
    And I press 'Cancel' button
    And I press 'Settings' button
    And I should see 'user_guest' email in the user email field


  Scenario: Unregistered user should not be able to view Account Settings button

    Given I navigate to visitor page
    Then I should not see ['Account Settings'] button
