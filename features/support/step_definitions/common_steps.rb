When /^I open verification link$/ do

  @hotel_cloud = HotelCloud.new
  if @hotel_cloud.staff_manager_page.has_header?
    @hotel_cloud.content_manager_page.header.wait_until_logout_button_visible
    @hotel_cloud.content_manager_page.header.logout_button.click
    @hotel_cloud.login_staff_page.wait_until_sign_in_button_visible
  end
  page.visit @verification_link
end

When /^I close request details pop up$/ do
  @hotel_cloud.request_details_page.close_button.click
end

When /^I refresh the page$/ do
  page.driver.browser.navigate.refresh
  sleep 5
end

When(/^I clear all cookies$/) do
  page.driver.browser.manage.delete_all_cookies
end

When /^I wait (\d+) seconds$/ do  |fs|
  sleep fs.to_i
end

When /^I delete all previous emails$/ do
  Gmail.new(EnvConfig.get(:email), EnvConfig.get(:email_password)) do |gmail|
    gmail.inbox.emails(:from => EnvConfig.get(:notification_email)).each do |email|
      email.delete!
    end
  end
end

When(/^I '(.*)' deletion$/) do |action|
  case action
    when 'confirm'
      page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist
    when 'decline'
      page.driver.browser.switch_to.alert.dismiss unless Capybara.javascript_driver == :poltergeist
  end
  sleep 2
end

Then /^I should( not)? get email to mailbox with '(.*)' subject and '(.*)' link$/ do | negate, subject, link |
  @verification_link = nil
  wait_counter = 0
  while wait_counter < 5 && @verification_link.nil? do
    sleep 10
    Gmail.new(EnvConfig.get(:email), EnvConfig.get(:email_password)) do |gmail|

      email = gmail.inbox.emails(:unread, :from => EnvConfig.get(:notification_email), :subject => subject).last
      if email.nil?
        @verification_link = nil
      else
        @verification_link = parse_link_from(email.body.parts[1].decoded, link)
      end
    end
    wait_counter += 1
  end
  negate ? @verification_link.should(be_nil) : @verification_link.should_not(be_nil)
end
