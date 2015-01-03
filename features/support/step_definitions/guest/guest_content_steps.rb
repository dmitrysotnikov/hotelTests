
When(/^I search '(.*)' item/) do |item_name|
  @hotel_cloud.visitor_home_page.wait_until_search_field_visible
  @hotel_cloud.visitor_home_page.search_field.set unique_value(item_name)
  @hotel_cloud.visitor_home_page.wait_until_results_title_visible
end

When(/^I clear search/) do
  @hotel_cloud.visitor_home_page.clear_search_button.click
  @hotel_cloud.visitor_home_page.wait_until_results_title_invisible
end

When /^I open '(.*)' folder$/ do |folder|
  @hotel_cloud.visitor_home_page.select_item folder
end

When /^I open '(.*)' created item/ do |folder|
  @hotel_cloud.visitor_home_page.select_item unique_value(folder)
end

When /^I select '(.*)' service$/ do |service|
  @hotel_cloud.folder_page.select_item service
end

When /^select '(.*)' from calendar$/ do |data|
  @hotel_cloud.folder_page.calendar_button.click
  @hotel_cloud.calendar_pop_up.select_day data
  @hotel_cloud.calendar_pop_up.dove_save_button.click
end

When /^I add service to order$/ do
  @hotel_cloud.service_pop_up.add_service_to_order_button.click
end

When /^I place service order$/ do
  @hotel_cloud.service_pop_up.place_service_order.click
end

When /^I save payment info$/ do
  @hotel_cloud.payment_pop_up.card_number_field.set "4111111111111111"
  @hotel_cloud.payment_pop_up.expires_field.set "1217"
  @hotel_cloud.payment_pop_up.name_on_card_field.set "Testing"
  @hotel_cloud.payment_pop_up.cvc_field.set "123"
  @hotel_cloud.payment_pop_up.save_button.click
end

When /^I place service order from cart$/ do
  @hotel_cloud.folder_page.place_order_from_cart_button.click
end

When /^I select '(.*)' day from calender and place order from folder with section$/ do  |data|
  @hotel_cloud.service_pop_up.add_service_to_order_button.click
  @hotel_cloud.folder_page.calendar_button.click
  @hotel_cloud.calendar_pop_up.select_day data
  @hotel_cloud.calendar_pop_up.dove_save_button.click
  @hotel_cloud.folder_page.place_order_from_cart_button.click
end

When /^I press language button$/ do
  @hotel_cloud.visitor_home_page.language_button.click
  sleep 2
end

When /^I open language pop up as logged in user$/ do
  sleep 3
  @hotel_cloud.visitor_home_page.click_language_button
  sleep 2
end

When(/^I press '(.*)' button in the \[Thank you\] pop up/) do |button|
  @hotel_cloud.thank_you_pop_up.go_to_requests_button.click if button.eql? 'Track order'
  @hotel_cloud.thank_you_pop_up.done_button.click if button.eql? 'Done'
end

When(/^I add service to favorites$/) do
  @hotel_cloud.folder_page.wait_until_favorites_button_visible
  @hotel_cloud.folder_page.click_favorites_button
  @hotel_cloud.folder_page.wait_until_delete_favorites_button_visible
end

When(/^I delete service from favorites$/) do
  @hotel_cloud.folder_page.wait_until_delete_favorites_button_visible
  @hotel_cloud.folder_page.delete_favorites_button.click
  @hotel_cloud.folder_page.wait_until_favorites_button_visible
end

When(/^I close folder$/) do
  @hotel_cloud.folder_page.close_folder.click
  sleep 2
end



Then /^I should see '(.*)' service form with '(.*)'$/ do |service, price|
  @hotel_cloud.service_pop_up.header.text.should == service
  @hotel_cloud.service_pop_up.unit_price.text.should == price
end

Then /^I should( not)? see '(.*)' on Thank You pop up$/ do |negate, text|
  negate ? @hotel_cloud.thank_you_pop_up.order_status.text.should_not == text : @hotel_cloud.thank_you_pop_up.order_status.text.should == text
end

Then /^I should see disabled \[Place Order\] button$/ do
  @hotel_cloud.folder_page.disable_place_button.should(be_visible)
end

Then /^I should see '(.*)' on language popup$/ do |status|
  @hotel_cloud.visitor_home_page.current_language.text.should == status
end

Then /^I should see the following data for '(.*)' service$/ do |service_name, table|
  step "I open '#{service_name}' created item"

  table.hashes.each do |service|
    section_title = service[:section_title]
    item_price = service[:item_price]
    item_name = service[:item_name]
    total_price = service[:total_price]
    price = service[:price]
    additional_item_name = service[:additional_item_name]
    additional_item_price = service[:additional_item_price]
    additional_item_text = service[:additional_item_text]

    @hotel_cloud.service_pop_up.section_name_value.should == (unique_value(section_title)) if section_title
    @hotel_cloud.service_pop_up.item_price_content(unique_value(item_name)).should == (item_price) if item_name
    @hotel_cloud.service_pop_up.total_price_value.should == (total_price) if total_price
    @hotel_cloud.service_pop_up.price_value.should eql? (price) if price
    @hotel_cloud.service_pop_up.additional_item_text_value unique_value(additional_item_text) if additional_item_text
    @hotel_cloud.service_pop_up.additional_item_price(unique_value(additional_item_name)).should == (additional_item_price) if additional_item_name
  end
end

Then /^I should( not)? see item section$/ do |negate|
  section = @hotel_cloud.service_pop_up.has_items_section?
  negate ? section.should(be_falsey) : section.should(be_truthy)
end

Then /^I should see the following data in dropdown for '(.*)' service$/ do |service_name, table|
  step "I open '#{service_name}' created item"

  table.hashes.each do |service|
    section_title = service[:section_title]
    item_price = service[:item_price]
    item_name = service[:item_name]
    total_price = service[:total_price]
    price = service[:price]

    @hotel_cloud.service_pop_up.section_name_value.should == (unique_value(section_title)) if section_title
    @hotel_cloud.service_pop_up.options_items_service.text.should == (unique_value(item_name) + " - "  + (item_price))

  end
end

Then /^I should see the following data in list items for '(.*)' service$/ do |service_name, table|
  step "I open '#{service_name}' created item"

  table.hashes.each do |service|
    section_title = service[:section_title]
    item_price = service[:item_price]
    item_name = service[:item_name]
    total_price = service[:total_price]
    price = service[:price]

    @hotel_cloud.service_pop_up.section_name_value.should == (unique_value(section_title)) if section_title
    @hotel_cloud.service_pop_up.options_items_list.text.should eql? (unique_value(item_name) + " - "  + (item_price))

  end
end


Then /^I should not see section for '(.*)' service$/ do |service_name|
  step "I open '#{service_name}' created item"

  @hotel_cloud.service_pop_up.should have_no_section
end

Then(/^I should see '(.*)' phone number in the service pop up$/) do |number|
  expect(@hotel_cloud.service_pop_up.call_button).to have_content('CALL ' + number)
end

Then(/^I should see '(.*)' phone number in the shopping cart$/) do |number|
  expect(@hotel_cloud.folder_page.place_order_from_cart_button_value).to have_content('CALL ' + number)
end

Then (/^I should( not)? see '(.*)' title in folder$/) do |negate, title|
  name = @hotel_cloud.folder_page.cart_folder_title.should eql title.upcase
  negate ? name.should(be_falsey)  : name.should(be_truthy)
end

Then (/^I should( not)? see \[Shopping Cart\] title in folder$/) do |negate|
  @hotel_cloud.folder_page.wait_until_back_button_visible
  name = @hotel_cloud.folder_page.has_shopping_cart_title?
  negate ? name.should(be_falsey)  : name.should(be_truthy)
end

Then (/^I should( not)? see \[Shopping Cart\] icon$/) do |negate|
  @hotel_cloud.folder_page.wait_until_back_button_visible
  button = @hotel_cloud.folder_page.has_shopping_cart_icon?
  negate ? button.should(be_falsey) : button.should(be_truthy)
end

Then (/^I should see '(.*)' button in service popup$/) do |button|
  expect(@hotel_cloud.service_pop_up.add_service_to_order_value).to have_content(button.upcase)
end

Then (/^I should see 'Delivery Charge' text and '(.*)' price in folder$/) do |price|
  expect(@hotel_cloud.folder_page.delivery_charge_value).to have_content('Delivery charge' + price)
end

Then (/^I should see '(.*)' price \+ '(.*)' delivery \+ '(.*)'% tax in total order price$/) do |price,delivery, tax|
  total = (price.to_i+delivery.to_i+(((price.to_i)/100)*tax.to_i)).to_s
  expect(@hotel_cloud.folder_page.total_order_price_value).to have_content(total)
end

Then (/^I should see '(.*)' in service popup$/) do |percentage|
  expect(@hotel_cloud.service_pop_up.tax_percentage_value).to have_content(percentage)
end

Then (/^I should see service details popup with following details:$/) do |table|

  table.hashes.each do |data|
    price = data[:price]
    tax = data[:tax]
    delivery = data[:delivery]
    total = data[:total]


    @hotel_cloud.request_details_pop_up.table_value(price,:price).should.present?
    if tax == '-'
      expect(@hotel_cloud.request_details_pop_up.tax_value).to have_content(tax)
    else
      expect(@hotel_cloud.request_details_pop_up.tax_value).to have_content(((price.to_i)/100)*tax.to_i)
    end
    expect(@hotel_cloud.request_details_pop_up.delivery_value).to have_content(delivery)
    if total.include? ("price" || "delivery" || "tax")
      expect(@hotel_cloud.request_details_pop_up.total_value).to have_content((price.to_i+delivery.to_i+(((price.to_i)/100)*tax.to_i)).to_s)
    else
      expect(@hotel_cloud.request_details_pop_up.total_value).to have_content(total)
    end
  end
  @hotel_cloud.request_details_pop_up.close_window.click
end

Then (/^I should see '(.*)' item title in item pop up$/) do |title|
  expect(@hotel_cloud.service_pop_up.title).to have_content(title)
end

Then(/^I should see '(.*)' item title in service pop up$/) do |title|
  expect(@hotel_cloud.service_pop_up.service_title).to have_content(title)
end

Then (/^I should see '(.*)' item description in item pop up$/) do |description|
  expect(@hotel_cloud.service_pop_up.description).to have_content(description)
end

Then (/^I should see '(.*)' feature in item pop up$/) do |feature|
  expect(@hotel_cloud.service_pop_up.feature).to have_content(feature)
end

Then /^I see \[Open\] button leads on '(.*)' page$/ do |link|
  href = @hotel_cloud.service_pop_up.open_href
  href.should == link
end

Then(/^I should( not)? see '(.*)' element in service pop up$/) do |negate, element|
  case element
    when 'Google maps'
      section = @hotel_cloud.service_pop_up.has_google_map?
    when 'Pickup address'
      section = @hotel_cloud.service_pop_up.has_pickup_address_field?
    when 'Drop off address'
      section = @hotel_cloud.service_pop_up.has_drop_off_address_field?
    when 'Pickup time'
      section = @hotel_cloud.service_pop_up.has_pickup_time_field?
    when 'Notes'
      section = @hotel_cloud.service_pop_up.has_notes_field?
    when 'Order'
      section = @hotel_cloud.service_pop_up.has_order_button?
    when 'Amount section'
      section = @hotel_cloud.service_pop_up.has_amount_section?
    when 'Schedule'
      section = @hotel_cloud.service_pop_up.has_calendar_button?
    when 'Place order'
      section = @hotel_cloud.service_pop_up.has_place_service_order?
    else
      raise ArgumentError.new "message: #{element} is not supported"
  end
  negate ? section.should(be_falsey) : section.should(be_truthy)
end

Then(/^I should see '(.*)' price in service pop up$/) do |price|
  @hotel_cloud.service_pop_up.unit_price.text.should == price
end

Then (/^I should( not)? see '(.*)' items on guest page$/) do |negate, name|
  item = @hotel_cloud.visitor_home_page.item_locator unique_value(name)
  visible = element_present?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end

Then (/^I should( not)? see '(.*)' item in list view$/) do |negate, name|
  item = @hotel_cloud.visitor_home_page.list_item_locator unique_value(name)
  visible = element_present?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end

Then (/^I should( not)? see '(.*)' items with '(.*)' cover hint on guest page$/) do |negate, name, hint|
  item = @hotel_cloud.visitor_home_page.hint_item_locator(unique_value(name), unique_value(hint))
  visible = element_present?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end

Then (/^I should( not)? see '(.*)' items on \[Favorites\] page$/) do |negate, name|
  item = @hotel_cloud.favorites_page.item_locator unique_value(name)
  visible = element_present?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end

Then (/^I see (\d+) items on guest page$/) do |quantity|
  sleep 1
  @hotel_cloud.content_manager_page.items_quantity.count.should eql(quantity.to_i)
end

Then (/^I should see '(.*)' item after '(.*)'$/) do |item, item2|
  @hotel_cloud.content_manager_page.first_after_second?(item2).should be_truthy
end
