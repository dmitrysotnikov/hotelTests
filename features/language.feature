Feature: Language

  Scenario: User should be able to populate different language for folder

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | language | title_lang | hint_lang |
      | testFolder | Chinese  | t_lang     | h_lang    |
    And I click ['Preview'] button at content page
    And I press language button
    And select 'Chinese' language from list
    Then I should see 't_lang' items on guest page

  Scenario: User should be able to populate different language for service

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | language | title_lang | hint_lang |
      | testService | German   | title_l    | hint_l    |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I press language button
    And select 'German' language from list
    Then I should see 'title_l' items on guest page

  Scenario: User should be able to populate different language for info

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | language | title_lang | hint_lang |
      | testInfo | Russian  | title_l    | hint_l    |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    And I press language button
    And select 'Russian' language from list
    Then I should see 'title_l' items on guest page
    When I press language button
    And select 'English' language from list

  Scenario: User should be able to populate different language for link

    Given I am login to backend as staff
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    And I logout from staff account
    And I am on login visitor page
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I search 'testFolder' item
    And I select 'testFolder' service
    And I add service to favorites
    And I press language button
    And select 'Russian' language from list
    Then I should see 'Избранное' text on [Favorites] button


  Scenario: User should be able to populate different language for enquiry

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       | language | title_lang |
      | testEnquiry | Chinese  | t_lang     |
    And I click ['Preview'] button at content page
    And I press language button
    And select 'Chinese' language from list
    Then I should see 't_lang' items on guest page


  Scenario: User should be able to change language
  #Should be used as the last scenario to move back to English language
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open language pop up as logged in user
    And select 'Spanish' language from list
    Then I should see 'PEDIDAS' button in header
    When I open language pop up as logged in user
    Then I should see 'EL IDIOMA SELECIONADO ES' on language popup
    When select 'English' language from list
    Then I should see 'REQUESTS' button in header


  Scenario: User should be able to cancel language changing
    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I open language pop up as logged in user
    And I select 'Spanish' language
    And I press 'Cancel' button in the [Language] pop up
    Then I should see 'REQUESTS' button in header
