When /^I create new guest account using the following details:$/ do |table|

  @hotel_cloud.guest_manager_page.header.guest_manager_tab.click
  @hotel_cloud.guest_manager_page.new_guest_button.click
  guest = table.rows_hash
  last = guest[:last_name]
  room = guest[:room]
  check_in_date = guest[:check_in_date]
  check_out_date = guest[:check_out_date]
  check_in_time = guest[:check_in_time]
  check_out_time = guest[:check_out_time]

  #fill form
  @hotel_cloud.add_guest_pop_up.last_name_field.set unique_value last if last
  if room
    @room = Faker::Number.number(5) if room.eql? 'random'
    @hotel_cloud.add_guest_pop_up.room_field.set @room
  end
  @hotel_cloud.add_guest_pop_up.set_check_in convert_time("today", "%Y-%m-%d"), (convert_time(check_in_date, "%Y-%m-%d") if check_in_date)
  @hotel_cloud.add_guest_pop_up.input_check_in_time check_in_time if check_in_time
  @hotel_cloud.add_guest_pop_up.set_check_out convert_time("today+7", "%Y-%m-%d"), (convert_time(check_out_date, "%Y-%m-%d") if check_out_date)
  @hotel_cloud.add_guest_pop_up.input_check_out_time check_out_time if check_out_time
  @hotel_cloud.add_guest_pop_up.save_button.click
  sleep 3

end

When /^I edit guest account using the following details:$/ do |table|

  guest = table.rows_hash
  last = guest[:last_name]
  room = guest[:room]
  check_in_date = guest[:check_in_date]
  check_out_date = guest[:check_out_date]
  check_in_time = guest[:check_in_time]
  check_out_time = guest[:check_out_time]

  #fill form
  @hotel_cloud.add_guest_pop_up.last_name_field.set unique_value last if last
  if room
    @room = Faker::Number.number(5) if room.eql? 'random'
    @hotel_cloud.add_guest_pop_up.room_field.set @room
  end
  @hotel_cloud.add_guest_pop_up.set_check_in convert_time("today", "%Y-%m-%d"), (convert_time(check_in_date, "%Y-%m-%d") if check_in_date)
  @hotel_cloud.add_guest_pop_up.input_check_in_time check_in_time if check_in_time
  @hotel_cloud.add_guest_pop_up.set_check_out convert_time("today+7", "%Y-%m-%d"), (convert_time(check_out_date, "%Y-%m-%d") if check_out_date)
  @hotel_cloud.add_guest_pop_up.input_check_out_time check_out_time if check_out_time
  @hotel_cloud.add_guest_pop_up.save_button.click
  sleep 3

end

When /^I press on the '(.*)' guest with '(.*)' status$/ do |name, status|
  @hotel_cloud.guest_manager_page.click_guest(unique_value(name), status)
end


When /^I '(.*)' 'Check Out' checkbox$/ do |checkbox|
  @hotel_cloud.guest_manager_page.checkout_checkbox.set(checkbox.to_bool) if checkbox
end

When /^I press 'Checkout' button for guest$/ do
  @hotel_cloud.guest_manager_page.checkout_button.click
  page.driver.browser.switch_to.alert.accept
  sleep 2
end

When /^I fill '(.*)' message to the guest$/ do |message|
  @hotel_cloud.request_details_page.staff_message_field.set message
  @hotel_cloud.request_details_page.send_button.click
  @confirm_message = message
  sleep 1
end

Then /^I should not see message field$/ do
  @hotel_cloud.request_details_page.should have_no_staff_message_field
end

Then /^I should see '(.*)' status for request$/ do  |status|
  @hotel_cloud.request_details_page.request_status.text.should == status
end

Then /^I should see '(.*)' status for '(.*)' request$/ do  |status, request|
  @hotel_cloud.request_details_page.request_name_status(request).text.should == status
end

Then /^I should see '(.*)' action for request$/ do  |status|
  @hotel_cloud.request_details_page.action_status.text.should == status
end

Then /^I should see '(.*)' message from guest$/ do |message|
  @hotel_cloud.request_details_pop_up.confirm_message.text.eql? message
end

Then(/^I should see new guest with the following details:$/) do |table|

  guest = table.rows_hash
  last = guest[:last_name]
  room = guest[:room]
  check_in_date = guest[:check_in_date]
  check_out_date = guest[:check_out_date]
  check_in_time = guest[:check_in_time]
  check_out_time = guest[:check_out_time]
  status = guest[:status]

  room = @room if room.eql? 'random'

  row = @hotel_cloud.guest_manager_page.all_values_from_row room
  row[:last_name].should == unique_value(last) if last
  row[:room].should == room
  row[:check_in_date].should include convert_time(check_in_date, "%-d %b") if check_in_date
  row[:check_out_date].should include convert_time(check_out_date, "%-d %b") if check_out_date
  row[:check_in_date].should include check_in_time if check_in_time
  row[:check_out_date].should include check_out_time if check_out_time
  row[:status].should include status if status
end

Then /^I should( not)? see '(.*)' guest with '(.*)' status$/ do |negate, name, status|

  item = @hotel_cloud.guest_manager_page.guest(unique_value(name), status)
  negate ? item.should_not(be_visible) : item.should(be_visible)
end