When /^I add new sections? with the following data:$/ do |table|
  @hotel_cloud.section_folder_page.wait_until_add_section_button_visible
  @hotel_cloud.section_folder_page.add_section_button.click

  table.hashes.each do |section|
    name = section[:name]

    @hotel_cloud.add_section_pop_up.name_field.set unique_value(name) if name
    @hotel_cloud.add_section_pop_up.save_button.click
    sleep 2
  end

end

When(/^I press '(.*)' button from section$/) do |button|
  if button.eql? 'Delete'
     @hotel_cloud.section_folder_page.action button
     page.driver.browser.switch_to.alert.accept
     sleep 2
  else
     @hotel_cloud.section_folder_page.action button
  end

end

When(/^I fill '(.*)' title to the field$/) do |name|
  @hotel_cloud.add_section_pop_up.name_field.set unique_value(name) if name
  @hotel_cloud.add_section_pop_up.save_button.click
  @hotel_cloud.add_section_pop_up.wait_until_save_button_invisible
end

When(/^I move '(.*)' after '(.*)'$/)do |section, target|
  @hotel_cloud.section_folder_page.drag_and_drop_section unique_value(section), unique_value(target)
end

When (/^I press on '(.*)' button from folder$/) do |button|

  if @hotel_cloud.folder_page.list_view_button_name.should eql button
    @hotel_cloud.folder_page.button_list_view.click
  end

end

Then /^I should( not)? see '(.*)' section in the folder$/ do |negate, name|
  section = @hotel_cloud.section_folder_page.section_locator unique_value(name)
  visible = element_visible?(section)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end

Then(/^I should see '(.*)' before '(.*)'$/) do |first, second|
  @hotel_cloud.section_folder_page.section_names.last.text.should eql("Section Title: #{unique_value(second)}")
end

Then (/I should see '(.*)' button in folder$/) do |button|
  @hotel_cloud.folder_page.list_view_button_name.should eql button
end

Then(/^I should( not)? see \[Add Section\] link$/) do |negate|
  button = @hotel_cloud.section_folder_page.has_add_section_button?
  negate ? button.should(be_falsey) : button.should(be_truthy)
end


