Feature: Settings

  Scenario: Staff should be able to change time format settings
  # Failed due to https://hotelcloud.atlassian.net/browse/HC-2714
    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I fill data fields with following data:
      | check_in | check_out | checkbox |
      | 00:00    | 00:00     | yes      |
    And I press 'Save Settings' button on the settings page
    Then I should see the following dates on the New Guest popup:
      | check_in | check_out |
      | pm       | pm        |
    When I press 'Hotel Settings' button in the header
    And I fill data fields with following data:
      | check_in | check_out | checkbox |
      | 00:00    | 00:00     | no       |
    And I press 'Save Settings' button on the settings page
    Then I should not see the following dates on the New Guest popup:
      | check_in | check_out |
      | am       | am        |
    When I clear all cookies

  Scenario: Staff should be to set Apple touch startup image

    Given I am on login visitor page
    And I look to the startup image
    And I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I upload 'logo.jpg' file as startup image
    And I logout from staff account
    And I am on login visitor page
    Then I should see updated startup image
    When I clear all cookies


  Scenario: Staff should be to set Apple touch icon

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I look to the apple touch icon
    And I upload 'logo.jpg' file as apple touch icon
    And I press 'Save Settings' button on the settings page
    Then I should see updated apple touch icon
    When I clear all cookies


  Scenario: Staff should be able to set default currency

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I select 'EUR' default currency
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Add Service'] button at content page
    And I create new service using the following data:
      | title       | price |
      | testService |  100  |
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService' service
      | total_price |   price  |
      | €100.00     |  €100.00 |
    When I open [Staff Manager] page
    And I press 'Hotel Settings' button in the header
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    When I clear all cookies


  Scenario: Staff should be able to set available languages

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I select languages using following data:
      | language   | checkbox |
      | French     | yes      |
      | Spanish    | yes      |
      | Hebrew     | yes      |
      | Portuguese | yes      |
      | Chinese    | yes      |
      | English    | yes      |
      | Turkish    | yes      |
      | Italian    | yes      |
      | Arabic     | yes      |
      | Russian    | yes      |
      | German     | yes      |
    And I press 'Save Settings' button on the settings page
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open language pop up as logged in user
    Then I should see available languages:
      | language   |
      | French     |
      | Hebrew     |
      | Portuguese |
      | Chinese    |
      | Spanish    |
      | English    |
      | Turkish    |
      | Italian    |
      | Arabic     |
      | Russian    |
      | German     |
    When I press 'Logout' button
    And I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I select languages using following data:
      | language   | checkbox |
      | French     | yes      |
      | Spanish    | yes      |
      | Hebrew     | yes      |
      | Portuguese | yes      |
      | Chinese    | yes      |
      | English    | yes      |
      | Turkish    | yes      |
      | Italian    | yes      |
      | Arabic     | yes      |
      | Russian    | yes      |
      | German     | yes      |
    And I press 'Save Settings' button on the settings page
    When I clear all cookies


  Scenario: Check magic login with 0.0.0.0/0 inside Auto registration cidr

    Given I delete all previous emails
    And I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I fill [Auto Registration] field with '0.0.0.0/0' value
    And I press 'Save Settings' button on the settings page
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    Then I should see 'Your account was successfully confirmed. You are now signed in.' notice
    When I press 'Logout' button
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I logout from staff account
    And I am on login visitor page
    And I login as 'user_guest' user with 'test12345' password
    Then I should see '01' in the request button
    When I press 'Request' button
    Then I should see 'CONFIRMED' status for request


  #Scenario: Check magic login with nothing inside Auto registration cidr
  # Is blocked by issue https://basecamp.com/1773836/projects/5953306/todos/102210967
  #  Given I am login to backend as staff
  #  When I press 'Hotel Settings' button in the header
  #  And I fill [Auto Registration] field with '' value
  #  And I press 'Save Settings' button on the settings page
  #  And I logout from staff account
  #  And I am on login visitor page
  #  And I click ['Create Account'] button at [Login] page
  #  And I fill your information popup with following data:
  #    | first_name | last_name | email      | password  | password_confirmation |
  #  | first      | last      | user_guest | test12345 | test12345             |
  #  Then I should see 'first last' user name on the visitor page
  #  When I logout
  #  And I am login to backend as staff
  #  And I press 'Hotel Settings' button in the header
  #  And I fill [Auto Registration] field with '0.0.0.0/0' value
  #  And I press 'Save Settings' button on the settings page


  Scenario: Staff should be able to copy folder from another hotel
  #Bug https://hotelcloud.atlassian.net/browse/HC-2588
    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I select 'NewVendor' hotel from [Copy Content] dropdown
    And I check folders using following data:
      | folder      | checkbox |
      | test otem   | yes      |
    And I press 'Start copying' button on the settings page
    And I open [Content Manager] page
    And I refresh the page
    Then I should see 'pre-setup NewVendor Export' item on content management page
    When I press on 'pre-setup NewVendor Export' item from list
    Then I should see 'pre-setup test otem' item on content management page
    When I open [Content Manager] page
    When I press 'Delete' button for 'pre-setup NewVendor Export' item
    And I 'confirm' deletion
    Then I should not see 'pre-setup NewVendor Export' item on content management page
    When I clear all cookies


  Scenario: Staff should be able to disable chat

    Given I delete all previous emails
    And I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I make 'checked' 'Disable chat' checkbox
    And I press 'Save Settings' button on the settings page
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I should get email to mailbox with 'Confirmation instructions' subject and 'Confirm' link
    And I open verification link
    And I press 'Logout' button
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I open 'pre-setup Auto-registration' request with 'Pending' status
    And I press 'Confirm' button on request details popup
    And I open 'pre-setup Auto-registration' request with 'Archived' status
    Then I should not see message field
    When I refresh the page
    And I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Disable chat' checkbox
    And I press 'Save Settings' button on the settings page
    When I clear all cookies


  Scenario: Staff should be able to set required visitor login

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I make 'checked' 'Required Visitor Login' checkbox
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I press 'Preview' button at content page with enabled Require visitor login options
    Then I should see 'Login' button on login page
    When I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Required Visitor Login' checkbox
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    Then I should see ['Login'] button
    When I clear all cookies


  Scenario: Staff should be able to set tax

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I set '20' % tax
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Add Folder'] button at content page
    Then I should see 'Add Tax' checkbox on folder page
    Then I should see '20.0%' tax for adding
    And I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I set '0' % tax
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Add Folder'] button at content page
    Then I should not see 'Add Tax' checkbox on folder page
    When I clear all cookies


  Scenario: Staff should be able to set delivery

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I set '20' to delivery charge
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Add Folder'] button at content page
    Then I should see 'Add delivery' checkbox on folder page
    Then I should see '$20.00' delivery for adding
    And I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I set '0' to delivery charge
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Add Folder'] button at content page
    Then I should not see 'Add delivery' checkbox on folder page
    When I clear all cookies


  Scenario: Staff should be able to set butler enabled

    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
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
    Then I should see ['Butler'] button
    When I press 'Butler' button
    And I confirm my butler
    Then I should see 'Order On Hold' on Thank You pop up
    When I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I refresh the page
    Then I should see 'Butler' request with 'Pending' status
    When I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I login as 'user_guest' user with 'test12345' password
    Then I should not see ['Butler'] button
    When I clear all cookies

  Scenario: Unregistered user should not see butler button
    Given I am login to backend as staff
    When I press 'Hotel Settings' button in the header
    And I make 'checked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I click ['Preview'] button at content page
    Then I should not see ['Butler'] button
    When I am login to backend as staff
    And I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Butler Enabled' checkbox
    And I press 'Save Settings' button on the settings page
    And I clear all cookies




