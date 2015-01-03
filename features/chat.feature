Feature: Chat


  Scenario: Guest should be able to start chat with staff

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
    And I press 'yes' for 'Show All' checkbox
    And I open 'pre-setup Auto-registration' request with 'Archived' status
    And I fill 'Tester' message to the guest
    And I close request details pop up
    And I logout from staff account
    And I login as 'user_guest' user with 'test12345' password
    And I press 'Request' button
    And I open request
    Then I should see 'Tester' message from staff
    When I fill 'Set' message to the staff
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I press 'yes' for 'Show All' checkbox
    And I open 'pre-setup Auto-registration' request with 'Confirmed' status
    Then I should see 'Set' message from guest