Feature: Delete Test Content

  Background:
    Given I am login to backend as staff
    When I open [Content Manager] page


  Scenario: Delete test folders
    And I click delete for 'testFolder' test item


  Scenario: Delete test services
    And I click delete for 'testService' test item


  Scenario: Delete test info
    And I click delete for 'testInfo' test item


  Scenario: Delete test links
    And I click delete for 'testLink' test item


  Scenario: Delete test enquiry
    And I click delete for 'testEnquiry' test item

  Scenario: Archive new requests
    And I press 'Requests' button in the header
    And I archive 'new' requests

  Scenario: Archive current requests
    And I press 'Requests' button in the header
    And I archive 'current' requests

  Scenario: Archive past requests
    And I press 'Requests' button in the header
    And I archive 'past' requests
