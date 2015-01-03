Feature: Create content

  Background:
    Given I am login to backend as staff

  Scenario: Content manager should be able to create service

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       |
      | testService |
    Then I should see 'testService' item on content management page
    When I refresh the page
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testService' items on guest page


  Scenario: Content manager should be able to create folder

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      |
      | testFolder |
    Then I should see 'testFolder' item on content management page
    When I refresh the page
    Then I should see 'testFolder' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testFolder' items on guest page


  Scenario: Content manager should be able to create info

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    |
      | testInfo |
    Then I should see 'testInfo' item on content management page
    When I refresh the page
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testInfo' items on guest page


  Scenario: Content manager should be able to create link

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     |
      | testLink | https://www.google.com/ |
    Then I should see 'testLink' item on content management page
    When I refresh the page
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testLink' items on guest page


  Scenario: Content manager should be able to create enquiry

    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       |
      | testEnquiry |
    Then I should see 'testEnquiry' item on content management page
    When I refresh the page
    Then I should see 'testEnquiry' item on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testEnquiry' items on guest page


  Scenario: Content manager should be able to create service with cover hint

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | hint     |
      | testService | testHint |
    Then I should see 'testService' item with 'testHint' cover hint on content management page
    When I refresh the page
    Then I should see 'testService' item with 'testHint' cover hint on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testService' items with 'testHint' cover hint on guest page


  Scenario: Content manager should be able to create folder with folder hint

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | hint     |
      | testFolder | testHint |
    Then I should see 'testFolder' item with 'testHint' cover hint on content management page
    When I refresh the page
    Then I should see 'testFolder' item with 'testHint' cover hint on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testFolder' items with 'testHint' cover hint on guest page


  Scenario: Content manager should be able to create info with cover hint

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | hint     |
      | testInfo | testHint |
    Then I should see 'testInfo' item with 'testHint' cover hint on content management page
    When I refresh the page
    Then I should see 'testInfo' item with 'testHint' cover hint on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testInfo' items with 'testHint' cover hint on guest page


  Scenario: Content manager should be able to create link with cover hint

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     | hint     |
      | testLink | https://www.google.com/ | testHint |
    Then I should see 'testLink' item with 'testHint' cover hint on content management page
    When I refresh the page
    Then I should see 'testLink' item with 'testHint' cover hint on content management page
    When I click ['Preview'] button at content page
    Then I should see 'testLink' items with 'testHint' cover hint on guest page


  Scenario: Content manager should not be able to create enquiry with empty name

    When I open [Content Manager] page
    And I click ['Add Enquiry'] button at content page
    And I click ['Save'] button in [Add Item] pop up
    Then I should stay on the popup for  'enquiry' creation


  Scenario: Content manager should not be able to create service with empty name

    When I open [Content Manager] page
    And I click ['Add Service'] button at content page
    And I click ['Save'] button in [Add Item] pop up
    Then I should stay on the popup for  'service' creation


  Scenario: Content manager should not be able to create folder with empty name
    When I open [Content Manager] page
    And I click ['Add Folder'] button at content page
    And I click ['Save'] button in [Add Item] pop up
    Then I should stay on the popup for  'folder' creation


  Scenario: Content manager should not be able to create link with empty name

    When I open [Content Manager] page
    And I click ['Add Link'] button at content page
    And I click ['Save'] button in [Add Item] pop up
    Then I should stay on the popup for  'link' creation


  Scenario: Content manager should not be able to create info with empty name

    When I open [Content Manager] page
    And I click ['Add Info'] button at content page
    And I click ['Save'] button in [Add Item] pop up
    Then I should stay on the popup for  'info' creation


  Scenario: Content manager should be able to create folder with phone number without shopping cart enabled option

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | phone     |
      | testFolder | 123456789 |
    Then I should see 'testFolder' item on content management page
    When I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       |
      | testService |
    And I click ['Preview'] button at content page
    And I select 'testService' service
    Then I should see '123456789' phone number in the service pop up


  Scenario: Content manager should be able to create folder with phone number with shopping cart enabled option

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | phone     | shopping_cart |
      | testFolder | 123456789 | checked       |
    Then I should see 'testFolder' item on content management page
    When I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       |
      | testService |
    And I click ['Preview'] button at content page
    And I select 'testService' service
    And I add service to order
    Then I should see '123456789' phone number in the shopping cart


  Scenario: Content manager should be able to create folder with shopping cart enabled option

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | checked       |
    And I press on 'testFolder' item from list
    Then I should see [Add Section] link
    When I create new service using the following data:
      | title       |
      | testService |
    And I click ['Preview'] button at content page
    Then I should see 'Shopping Cart' title in folder
    When I select 'testService' service
    Then I should see 'Add to Order' button in service popup


  Scenario: Content manager should be able to create folder without shopping cart enabled option

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart |
      | testFolder | unchecked     |
    And I press on 'testFolder' item from list
    Then I should not see [Add Section] link
    When I create new service using the following data:
      | title       |
      | testService |
    And I click ['Preview'] button at content page
    Then I should not see [Shopping Cart] title in folder


  Scenario: Content manager should be able to create folder with delivery charge
    When I press 'Hotel Settings' button in the header
    And I set '20' to delivery charge
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart | add_delivery |
      | testFolder | checked       | checked      |
    And I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       | price |
      | testService |  100  |
    And I click ['Preview'] button at content page
    Then I should see 'Delivery Charge' text and '$20' price in folder
    When I select 'testService' service
    And I add service to order
    Then I should see '100' price + '20' delivery + '0'% tax in total order price
    When I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I refresh the page
    And I open 'testService' request with 'Pending' status
    Then I should see service details popup with following details:
    | price | tax | delivery |              total            |
    |  100  |  -  |   20     |  "price" + "delivery" + "tax" |

  Scenario: Content manager should be able to create folder with tax
    When I press 'Hotel Settings' button in the header
    And I set '20' % tax
    And I make 'unchecked' 'Tax Included' checkbox
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart | add_tax |
      | testFolder | checked       | checked |
    And I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       | price |
      | testService |  200  |
    And I click ['Preview'] button at content page
    And I select 'testService' service
    Then I should see '20%' in service popup
    When I add service to order
    Then I should see '200' price + '0' delivery + '20'% tax in total order price
    When I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I refresh the page
    And I open 'testService' request with 'Pending' status
    Then I should see service details popup with following details:
      | price | tax  | delivery |              total            |
      |  200  |  20  |     -    |  "price" + "delivery" + "tax" |



  Scenario: Content manager should be able to create folder with tax and with delivery
    When I press 'Hotel Settings' button in the header
    And I set '20' % tax
    And I set '20' to delivery charge
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart | add_tax | add_delivery |
      | testFolder | checked       | checked |  checked     |
    And I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       | price |
      | testService |  200  |
    And I click ['Preview'] button at content page
    Then I should see 'Delivery Charge' text and '$20' price in folder
    When I select 'testService' service
    Then I should see '20%' in service popup
    When I add service to order
    Then I should see '200' price + '20' delivery + '20'% tax in total order price
    When I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I refresh the page
    And I open 'testService' request with 'Pending' status
    Then I should see service details popup with following details:
      | price | tax  | delivery  |              total            |
      |  200  |  20  |     20    |  "price" + "delivery" + "tax" |


  Scenario: Content manager should be be able to create folder with included tax
    When I press 'Hotel Settings' button in the header
    And I set '20' % tax
    And I make 'checked' 'Tax Included' checkbox
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    And I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart | add_tax |
      | testFolder | checked       | checked |
    And I press on 'testFolder' item from list
    And I create new service using the following data:
      | title       | price |
      | testService |  200  |
    And I click ['Preview'] button at content page
    And I select 'testService' service
    And I add service to order
    Then I should see '200' price + '0' delivery + '0'% tax in total order price
    When I place service order from cart
    And I click ['Create Account'] button at [Login] page
    And I fill your information popup with following data:
      | first_name | last_name | email      | password  | password_confirmation |
      | first      | last      | user_guest | test12345 | test12345             |
    And I fill 'random' room number
    And I press 'Register my stay' button on your information popup
    And I wait 3 seconds
    And I am login to backend as staff
    And I press 'Requests' button in the header
    And I 'Confirm auto-registration' 'Auto-registration' request with 'Pending' status on the requests list
    And I refresh the page
    And I open 'testService' request with 'Pending' status
    Then I should see service details popup with following details:
      | price | tax | delivery |              total            |
      |  200  |  -  |     -    |  "price" + "delivery" + "tax" |
    And I press 'Hotel Settings' button in the header
    And I make 'unchecked' 'Tax Included' checkbox
    And I select 'USD' default currency
    And I press 'Save Settings' button on the settings page
    And I clear all cookies


  Scenario: Content manager should be able to create folder with list view

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart | list_view |
      | testFolder | checked       | checked   |
    And I press on 'testFolder' item from list
    And I create new info using the following data:
      | title    |
      | testInfo |
    And I click ['Preview'] button at content page
    Then I should see 'testInfo' item in list view


  Scenario: Content manager should be able to create folder without list view

    When I open [Content Manager] page
    And I create new folder using the following data:
      | title      | shopping_cart | list_view |
      | testFolder | checked       | unchecked |
    And I press on 'testFolder' item from list
    And I create new info using the following data:
      | title    |
      | testInfo |
    And I click ['Preview'] button at content page
    Then I should see 'testInfo' items on guest page


  Scenario: Content manager should be able to create info with item title

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | info_title |
      | testInfo | testTitle  |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testInfo' item
    And I open 'testInfo' created item
    Then I should see 'testTitle' item title in item pop up


  Scenario: Content manager should be able to create info with item description

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | info_title | description     |
      | testInfo | testTitle  | testDescription |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    And I open 'testInfo' created item
    Then I should see 'testTitle' item title in item pop up
    And I should see 'testDescription' item description in item pop up


  Scenario: Content manager should be able to create info with feature

    When I open [Content Manager] page
    And I create new info using the following data:
      | title    | features    |
      | testInfo | testFeature |
    Then I should see 'testInfo' item on content management page
    When I click ['Preview'] button at content page
    And I open 'testInfo' created item
    Then I should see 'testFeature' feature in item pop up


  Scenario: Content manager should be able to create link with item title

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     | link_title |
      | testLink | https://www.google.com/ | testTitle  |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    And I open 'testLink' created item
    Then I should see 'testTitle' item title in item pop up


  Scenario: Content manager should be able to create link with item description

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     | link_title | description     |
      | testLink | https://www.google.com/ | testTitle  | testDescription |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    And I open 'testLink' created item
    Then I should see 'testTitle' item title in item pop up
    And I should see 'testDescription' item description in item pop up


  Scenario: Content manager should be able to create link with feature

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     | features    |
      | testLink | https://www.google.com/ | testFeature |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    And I open 'testLink' created item
    Then I should see 'testFeature' feature in item pop up


  Scenario: Content manager should be able to create link with enabled skip popup option

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     | skip_popup |
      | testLink | https://www.google.com/ | checked    |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    Then I see 'testLink' thumbnail leads on 'https://www.google.com/' page


  Scenario: Content manager should be able to create link without enabled skip popup option

    When I open [Content Manager] page
    And I create new link using the following data:
      | title    | url                     | skip_popup |
      | testLink | https://www.google.com/ | unchecked  |
    Then I should see 'testLink' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testLink' item
    Then I see 'testLink' thumbnail leads on 'test env' page
    When I open 'testLink' created item
    Then I see [Open] button leads on 'https://www.google.com/' page


  Scenario: Content manager should be able to create enquiry with item description
# Failed due to https://hotelcloud.atlassian.net/browse/HC-2832
    When I open [Content Manager] page
    And I create new enquiry using the following data:
      | title       | description     |
      | testEnquiry | testDescription |
    Then I should see 'testEnquiry' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testEnquiry' item
    And I open 'testEnquiry' created item
    And I should see 'testDescription' item description in item pop up


  Scenario: Content manager should be able to create service with item title

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | item_title |
      | testService | testTitle  |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see 'testTitle' item title in service pop up
    And I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with item description

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | description     |
      | testService | testDescription |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    And I should see 'testDescription' item description in item pop up
    And I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with item price

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | price |
      | testService | 200   |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see '200' price + '0' delivery + '0'% tax in total order price
    And I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with taxi template

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | template |
      | testService | Taxi     |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see 'Ordering a cab' item title in service pop up
    And I should see 'Google maps' element in service pop up
    And I should see 'Pickup address' element in service pop up
    And I should see 'Drop off address' element in service pop up
    And I should see 'Pickup time' element in service pop up
    And I should see 'Notes' element in service pop up
    And I should see 'Order' element in service pop up
    And I should not see 'Schedule' element in service pop up
    And I should not see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with enable quantity check box

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | enable_quantity |
      | testService | checked         |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see 'Amount section' element in service pop up
    Then I should see 'Price: Free' price in service pop up
    And I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with Free pricing policy

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | price_policy |
      | testService | Free         |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see 'Price: Free' price in service pop up
    And I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with By Quote pricing policy

    When I open [Content Manager] page
    And I create new service using the following data:
      | title       | price_policy |
      | testService | By Quote     |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see 'By quote' price in service pop up
    And I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up


  Scenario: Content manager should be able to create service with No Price pricing policy

    When I open [Content Manager] page
    And I create new service using the following data:
     | title       | price_policy |
     | testService | No Price     |
    Then I should see 'testService' item on content management page
    When I click ['Preview'] button at content page
    And I search 'testService' item
    And I open 'testService' created item
    Then I should see 'Schedule' element in service pop up
    And I should see 'Place order' element in service pop up
