Feature: Weather

  Scenario: User should be able to open weather popup

    Given I am on login visitor page
    When I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email       | password  | password_confirmation |
      | first      | last      | user_guest  | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I press 'Weather' button
    Then I should see '°C' format of temperature
    When I press 'Fahrenheit' temperature button
    Then I should see '°F' format of temperature
    When I press 'Celsius' temperature button
    Then I should see '°C' format of temperature
    When I press 'Close' temperature button
    Then I should not see [Weather] pop up
