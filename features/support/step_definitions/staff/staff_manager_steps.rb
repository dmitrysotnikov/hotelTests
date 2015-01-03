When(/^I press '(.*)' button in the header$/) do |button|
  @hotel_cloud.content_manager_page.header.press_tab button
end

When(/^I create new staff member account using the following details:$/) do |table|

  sleep 2
  @hotel_cloud.staff_manager_page.new_staff_button.click
  staff = table.rows_hash
  first = staff[:first_name]
  last = staff[:last_name]
  phone = staff[:phone]
  email = staff[:email]
  password = staff[:password]
  staff_manager = staff[:staff_manager]
  service_manager = staff[:service_manager]
  request_manager = staff[:request_manager]

  #fill form
  @hotel_cloud.new_staff_member_page.first_name_field.set unique_value first if first
  @hotel_cloud.new_staff_member_page.last_name_field.set unique_value last if last
  @hotel_cloud.new_staff_member_page.phone_field.set phone if phone
  @hotel_cloud.new_staff_member_page.email_field.set unique_email email if email
  @hotel_cloud.new_staff_member_page.password_field.set password if password
  @hotel_cloud.new_staff_member_page.staff_manager_checkbox.set(staff_manager.to_bool) if staff_manager
  @hotel_cloud.new_staff_member_page.service_manager_checkbox.set(service_manager.to_bool) if service_manager
  @hotel_cloud.new_staff_member_page.request_manager_checkbox.set(request_manager.to_bool) if request_manager
  @registered = "#{convert_time('today', "%-d %b")} #{convert_time('today', "%l:%M%P")}"
  @registered = @registered.gsub("  ", " ")
  @hotel_cloud.new_staff_member_page.save_button.click
  @hotel_cloud.new_staff_member_page.wait_until_save_button_invisible
end

When(/^I edit staff member account using the following details:$/) do |table|

  staff = table.rows_hash
  first = staff[:new_first_name]
  last = staff[:new_last_name]
  phone = staff[:new_phone]
  email = staff[:new_email]
  password = staff[:new_password]
  staff_manager = staff[:staff_manager]
  service_manager = staff[:service_manager]
  request_manager = staff[:request_manager]

  #fill form
  @hotel_cloud.new_staff_member_page.first_name_field.set unique_value first if first
  @hotel_cloud.new_staff_member_page.last_name_field.set unique_value last if last
  @hotel_cloud.new_staff_member_page.phone_field.set phone if phone
  @hotel_cloud.new_staff_member_page.email_field.set unique_email email if email
  @hotel_cloud.new_staff_member_page.password_field.set password if password
  @hotel_cloud.new_staff_member_page.staff_manager_checkbox.set(staff_manager.to_bool) if staff_manager
  @hotel_cloud.new_staff_member_page.service_manager_checkbox.set(service_manager.to_bool) if service_manager
  @hotel_cloud.new_staff_member_page.request_manager_checkbox.set(request_manager.to_bool) if request_manager
  @hotel_cloud.new_staff_member_page.save_button.click
  @hotel_cloud.new_staff_member_page.wait_until_save_button_invisible
end

When /^I open \[Staff Manager\] page$/ do
  @hotel_cloud.login_staff_page.load
end

When /^I select manager with '(.*)' email$/ do |email|
  @hotel_cloud.staff_manager_page.select_manager unique_email email
end

Then(/^I should( not)? see \['(.*)'\] button on the page$/)  do |negate, button|
  case button
    when 'Add'
      item = @hotel_cloud.content_manager_page.add_button
    when 'New Guest'
      item = @hotel_cloud.guest_manager_page.new_guest_button
    when 'Show All'
      item = @hotel_cloud.request_manager_page.show_all_checkbox
  end
  negate ? item.should_not(be_visible) : item.should(be_visible)
end

Then(/^I should( not)? see 'New Staff' button on the page$/)  do |negate|
  item = @hotel_cloud.staff_manager_page.new_staff_button
  negate ? item.should_not(be_visible) : item.should(be_visible)
end

Then /^I should see new staff member with the following details:$/ do |table|

  staff = table.rows_hash
  first = staff[:first_name]
  last = staff[:last_name]
  phone = staff[:phone]
  email = staff[:email]
  registered = staff[:registered]

  row = @hotel_cloud.staff_manager_page.all_values_from_row unique_email email
  row[:first_name].should == unique_value(first) if first
  row[:last_name].should == unique_value(last) if last
  row[:phone].should == phone if phone
  row[:email].should == unique_email(email) if email
  if registered
    if registered.eql? 'today'
      row[:registered].should == @registered
    else
      raise ArgumentError.new "invalid date value: #{registered}"
    end
  end
end
