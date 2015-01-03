Feature: Create Landing Item

  Scenario: Content manager should be able to create landing item

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I click ['Homepage Picture'] button at content page
    And I create new item on landing page with 'http://google.com' link and 'google.jpg' image
    Then I should see 'http://google.com' landing item on content management page
    And 'default link' image for 'http://google.com' landing item should not be visible on content management page


  Scenario: Content manager should be able to delete landing item

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I click ['Homepage Picture'] button at content page
    And I create new item on landing page with 'http://google.com' link and 'google.jpg' image
    Then I should see 'http://google.com' landing item on content management page
    When I delete item on landing page with 'http://google.com' link
    Then I should not see 'http://google.com' landing item on content management page


  Scenario: Content manager should be able to decline deletion of landing item

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I click ['Homepage Picture'] button at content page
    And I create new item on landing page with 'http://google.com' link and 'google.jpg' image
    Then I should see 'http://google.com' landing item on content management page
    When I press 'Delete' button for 'http://google.com' landing item
    And I 'decline' deletion
    Then I should see 'http://google.com' landing item on content management page


  Scenario: Content manager should be able to edit landing item

    Given I am login to backend as staff
    When I open [Content Manager] page
    And I click ['Homepage Picture'] button at content page
    And I create new item on landing page with 'http://google.com' link and 'google.jpg' image
    Then I should see 'http://google.com' landing item on content management page
    When I press 'Edit' button for 'http://google.com' landing item
    And I edit landing item using the following data:
     | link            |
     | http://ebay.com |
    Then I should see 'http://ebay.com' landing item on content management page



