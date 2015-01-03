Feature: Service section of options

  Background:
    Given I am login to backend as staff

  Scenario: Staff should be able to add section of options to the service

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title       |
      | testService |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add section' button for [Features] tab
    And In [Add Service Item] pop up i click 'Last section edit button' button for [Features] tab
    And I fill [Features] tab in [Add Service Item] form using the following data:
      | title | item_name | price  |
      | test  | item1     | 500.00 |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService' service
      | section_title | item_name | item_price |
      | test          | item1     | $500.00    |


  Scenario: Staff should be able to delete section of options from the service

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService2 |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add section' button for [Features] tab
    And In [Add Service Item] pop up i click 'Last section edit button' button for [Features] tab
    And I fill [Features] tab in [Add Service Item] form using the following data:
      | title | item_name | price  |
      | test  | item1     | 500.00 |
    And In [Add Service Item] pop up i click 'Last section delete button' button for [Features] tab
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should not see section for 'testService2' service


  Scenario: Staff should check at least one feature

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService3 |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add section' button for [Features] tab
    And In [Add Service Item] pop up i click 'Last section edit button' button for [Features] tab
    And I fill [Features] tab in [Add Service Item] form using the following data:
      | title | item_name | price  | required | quantity |
      | test  | item1     | 100.00 | checked  | checked  |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService3' service
      | section_title | item_price  |
      | test          | $100.00     |


  Scenario: Staff should be able to select multiple features

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService4 |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add section' button for [Features] tab
    And In [Add Service Item] pop up i click 'Last section edit button' button for [Features] tab
    And I fill [Features] tab in [Add Service Item] form using the following data:
      | title | item_name | price  | quantity |
      | test  | item1     | 100.00 | checked  |
    And In [Add Service Item] pop up i click 'Last section edit button' button for [Features] tab
    And I click ['Add Feature'] button in [Edit Section] pop up
    And I fill [Features] tab in [Add Service Item] form using the following data:
      | item_name | price  |
      | item2     | 200.00 |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data in dropdown for 'testService4' service
      | section_title | item_name | item_price |
      | test          | item1     | $100.00    |
    And I should see the following data in list items for 'testService4' service
      | section_title | item_name | item_price |
      | test          | item2     | $200.00    |


  Scenario: Staff should be able to add service with additional item

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService5 |
    And I click ['Features'] button in [Add Item] pop up
    And I fill [Additional Items] row using the following data:
      | name | price |
      | item | 100   |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService5' service
      | additional_item_name | additional_item_price |
      | item                 | $100.00               |


  Scenario: Staff should be able to add service with multiple additional items

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService6 |
    And I click ['Features'] button in [Add Item] pop up
    And I fill [Additional Items] row using the following data:
      | name | price |
      | item | 100   |
    And In [Add Service Item] pop up i click 'Add Feature' button for [Features] tab
    And I fill [Additional Items] row using the following data:
      | name  | price |
      | item2 | 200   |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService6' service
      | additional_item_name | additional_item_price |
      | item                 | $100.00               |
      | item2                | $200.00               |


  Scenario: Staff should be able to add service with additional text input item

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService7 |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add text input' button for [Features] tab
    And I fill [Additional Items] row using the following data:
      | name |
      | item |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService7' service
      | additional_item_text |
      | item                 |


  Scenario: Staff should be able to add service with multiple additional text input items

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService8 |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add text input' button for [Features] tab
    And I fill [Additional Items] row using the following data:
      | name |
      | item |
    And In [Add Service Item] pop up i click 'Add text input' button for [Features] tab
    And I fill [Additional Items] row using the following data:
      | name  |
      | item2 |
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    Then I should see the following data for 'testService8' service
      | additional_item_text |
      | item                 |
      | item2                |


  Scenario: Staff should be able to delete additional item from service

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService9 |
    And I click ['Features'] button in [Add Item] pop up
    And I fill [Additional Items] row using the following data:
      | name | price |
      | item | 100   |
    And In [Add Service Item] pop up i click 'Last additional item delete button' button for [Features] tab
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    And I open 'testService9' created item
    Then I should not see item section


  Scenario: Staff should be able to delete additional item text from service

    When I open [Content Manager] page
    And I fill [Main] tab in [Add Service Item] form using the following data:
      | title        |
      | testService10 |
    And I click ['Features'] button in [Add Item] pop up
    And In [Add Service Item] pop up i click 'Add text input' button for [Features] tab
    And I fill [Additional Items] row using the following data:
      | name |
      | item |
    And In [Add Service Item] pop up i click 'Last additional item delete button' button for [Features] tab
    And I click ['Save'] button in [Add Item] pop up
    And I click ['Preview'] button at content page
    And I open 'testService10' created item
    Then I should not see item section