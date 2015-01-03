When /^I fill data fields with following data:$/ do  |table|

  table.hashes.each do |setting|

    check_in = setting[:check_in]
    check_out = setting[:check_out]
    checkbox = setting[:checkbox]

  @hotel_cloud.hotel_settings_page.home_folder_name_field.set 'HOME'
  @hotel_cloud.hotel_settings_page.ampm_checkbox.set (checkbox.to_bool) if checkbox
  end
end

When /^I select languages using following data:$/ do  |table|

  table.hashes.each do |languages|

    language = languages[:language]
    checkbox = languages[:checkbox]

    @hotel_cloud.hotel_settings_page.language_checkbox(language).set (checkbox.to_bool) if language
  end
end

When /^I select '(.*)' hotel from \[Copy Content\] dropdown$/ do  |hotel|
  @hotel_cloud.hotel_settings_page.copy_from_hotel_dropdown select hotel
  sleep 5
end

When /^I check folders using following data:$/ do |table|

  table.hashes.each do |folders|

    folder = folders[:folder]
    checkbox = folders[:checkbox]

    @hotel_cloud.hotel_settings_page.folder_checkbox(folder).set (checkbox.to_bool)
  end
end

When /^I look to the apple touch icon$/ do
  @old_image = @hotel_cloud.hotel_settings_page.apple_touch_icon_name
end

When /^I press 'Save Settings' button on the settings page$/ do
  @hotel_cloud.hotel_settings_page.home_folder_name_field.set 'HOME'
  @hotel_cloud.hotel_settings_page.save_button.click
end

When /^I press 'Start copying' button on the settings page$/ do
  @hotel_cloud.hotel_settings_page.start_copy_hotel_button.click
end

When /^I upload '(.*)' file as startup image$/ do |image|
  @hotel_cloud.hotel_settings_page.upload_apple_touch_startup_image image
end

When /^I upload '(.*)' file as apple touch icon$/ do |image|
  @hotel_cloud.hotel_settings_page.upload_apple_touch_icon image
end

When /^I select '(.*)' default currency$/ do |currency|
  @hotel_cloud.hotel_settings_page.default_currency_dropdown select currency
end

When /^I set '(.*)' % tax$/ do |tax|
  @hotel_cloud.hotel_settings_page.tax_rate_field.set tax
end

When /^I set '(.*)' to delivery charge$/ do |delivery|
  @hotel_cloud.hotel_settings_page.delivery_charge_field.set delivery
end

When /^I fill \[Auto Registration\] field with '(.*)' value$/ do  |cidr|
    @hotel_cloud.hotel_settings_page.auto_registration_cidr.set cidr
end

When /^I make '(.*)' '(.*)' checkbox$/ do |checkbox, name|
  case name
    when 'Directory only'
      @hotel_cloud.hotel_settings_page.directory_only_checkbox.set(checkbox.to_bool) if checkbox
    when 'Required Visitor Login'
      @hotel_cloud.hotel_settings_page.require_visitor_login_checkbox.set(checkbox.to_bool) if checkbox
    when 'Disable chat'
      @hotel_cloud.hotel_settings_page.disabled_chat_checkbox.set(checkbox.to_bool) if checkbox
    when 'Tax Included'
      @hotel_cloud.hotel_settings_page.tax_included_checkbox.set(checkbox.to_bool) if checkbox
    when 'Butler Enabled'
      @hotel_cloud.hotel_settings_page.butler_enabled_checkbox.set(checkbox.to_bool) if checkbox
    when 'Butler requests'
      @hotel_cloud.user_preferences_page.butler_requests_email.set(checkbox.to_bool) if checkbox
    when 'Auto request'
      @hotel_cloud.user_preferences_page.auto_register_email_checkbox.set(checkbox.to_bool) if checkbox
    when 'Transportation'
      @hotel_cloud.user_preferences_page.home_line_checkbox.click
      @hotel_cloud.user_preferences_page.transportation_email_checkbox.set(checkbox.to_bool) if checkbox
  end

end

When /^I press 'Save Preference' button on preference page$/ do
  @hotel_cloud.user_preferences_page.save_pref_button.click
end

When /^I change '(.*)' to '(.*)'$/ do |password, new_password|
  @hotel_cloud.user_preferences_page.current_pass.set password
  @hotel_cloud.user_preferences_page.pass.set new_password
  @hotel_cloud.user_preferences_page.pass_confirm.set new_password
  @hotel_cloud.user_preferences_page.save_pref_button.click
end

Then /^I should( not)? see the following dates on the New Guest popup:$/ do |negate, table|
  table.hashes.each do |dates|

    check_in_data = dates[:check_in]
    check_out_data = dates[:check_out]

    @hotel_cloud.guest_manager_page.header.guest_manager_tab.click
    @hotel_cloud.guest_manager_page.new_guest_button.click
    # sleep 5
    check_in_button_text = @hotel_cloud.add_guest_pop_up.check_in_button.text
    check_out_button_text = @hotel_cloud.add_guest_pop_up.check_out_button.text
    negate ? (check_in_button_text.should_not include(check_in_data)) : (check_in_button_text.should include(check_in_data))
    negate ? (check_out_button_text.should_not include(check_out_data)) : (check_out_button_text.should include(check_out_data))
  end

end

Then /^I should see updated apple touch icon$/ do
  @hotel_cloud.hotel_settings_page.apple_touch_icon_name.should_not eql(@old_image)
end

Then /^I should see '(.*)' notification$/ do |value|
  expect(@hotel_cloud.visitor_home_page.accept_butler_popup_text).to have_content(value)
end



