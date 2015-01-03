When /^I open request$/ do
  @hotel_cloud.request_details_page.request_body.click
end

When /^I fill '(.*)' message to the staff$/ do |message|
  @hotel_cloud.request_details_page.message_field.set message
  @hotel_cloud.request_details_page.message_button.click
  sleep 5
end

When(/^I select '(.*)' language/) do |language|
  case language
    when 'Spanish'
      @hotel_cloud.visitor_home_page.choose_language "Spain"
    when 'English'
      @hotel_cloud.visitor_home_page.choose_language "United-Kingdom"
    when 'Russian'
      @hotel_cloud.visitor_home_page.choose_language "Russia"
    when 'Arabic'
      @hotel_cloud.visitor_home_page.choose_language "United-Arab-Emirates"
    when 'Chinese'
      @hotel_cloud.visitor_home_page.choose_language "China"
    when 'French'
      @hotel_cloud.visitor_home_page.choose_language "France"
    when 'German'
      @hotel_cloud.visitor_home_page.choose_language "Germany"
    when 'Hebrew'
      @hotel_cloud.visitor_home_page.choose_language "Israel"
    when 'Italian'
      @hotel_cloud.visitor_home_page.choose_language "Italy"
    when 'Portuguese'
      @hotel_cloud.visitor_home_page.choose_language "Portugal"
    when 'Turkish'
      @hotel_cloud.visitor_home_page.choose_language "Turkey"
    else
      raise ArgumentError.new "language: #{language} is not supported"
  end
end

When /^select '(.*)' language from list$/ do |language|
  button = 'Save'

  step "I select '#{language}' language"
  step "I press '#{button}' button in the [Language] pop up"
end

When(/^I press '(.*)' button in the \[Language\] pop up/) do |button|
  @hotel_cloud.visitor_home_page.save_language.click if button.eql? 'Save'
  @hotel_cloud.visitor_home_page.cancel_language.click if button.eql? 'Cancel'
end

When(/^I press favorites button$/) do
  @hotel_cloud.visitor_home_page.wait_until_favorites_folder_button_visible
  @hotel_cloud.visitor_home_page.favorites_folder_button.click
  @hotel_cloud.favorites_page.wait_until_favorites_folder_title_visible
end

Given /^I navigate to visitor page$/ do
  @hotel_cloud = HotelCloud.new
  @hotel_cloud.visitor_home_page.load
end

When /^I press '(.*)' button$/ do |button|
  case button
    when 'Weather'
      @hotel_cloud.visitor_home_page.header.weather_button.click
    when 'Settings'
      @hotel_cloud.visitor_home_page.header.settings_button.click
    when 'Language'
      @hotel_cloud.visitor_home_page.language_button.click
    when 'Logout'
      @hotel_cloud.visitor_home_page.header.wait_until_logout_button_visible
      @hotel_cloud.visitor_home_page.header.logout_button.click
    when 'Login'
      @hotel_cloud.visitor_home_page.header.login_button.click
    when 'Save'
      @hotel_cloud.visitor_home_page.save_language.click
    when 'Cancel'
      @hotel_cloud.visitor_home_page.cancel_button.click
    when 'Receive notifications'
      @hotel_cloud.visitor_home_page.receive_email_button.click
    when 'Remove Favorites'
      @hotel_cloud.visitor_home_page.remove_favorites.click
    when 'Butler'
      @hotel_cloud.visitor_home_page.butler_button.click
    when 'Home'
      @hotel_cloud.visitor_home_page.header.home_button.click
    when 'Request'
      @hotel_cloud.visitor_home_page.header.requests_button.click

    else
      raise ArgumentError.new "message: #{message} is not supported"
  end
end

When /^I confirm my butler$/ do
  @hotel_cloud.visitor_home_page.confirm_my_butler_button.click
  sleep 2
end

When /^I press '(.*)' temperature button$/ do |temperature|
  @hotel_cloud.weather_pop_up.fahrenheit_button.click if temperature.eql? 'Fahrenheit'
  @hotel_cloud.weather_pop_up.celsius_button.click if temperature.eql? 'Celsius'
  @hotel_cloud.weather_pop_up.close_button.click if temperature.eql? 'Close'
end

When /^I press 'Click to enter your room number >' link$/ do
  @hotel_cloud.visitor_home_page.choose_room_link.click
end

When(/^I change password to '(.*)' and confirmed password with '(.*)'$/) do |password, confirm_password|
  @hotel_cloud.forgot_password_popup.change_password(password, confirm_password)
end

When(/^I change email field with '(.*)' value$/) do |email|
  @hotel_cloud.visitor_home_page.email_field.set unique_email(email)
  @hotel_cloud.visitor_home_page.save_language.click
  sleep 1
end

When(/^I fill email field with '(.*)' value$/) do |email|
  @hotel_cloud.visitor_home_page.email_field.set unique_email(email)
end

When /^I copy code for import favorites$/ do
  @favorites_code = @hotel_cloud.visitor_home_page.favorites_code_field_value
end

When /^I fill '(.*)' code for imported favorites$/ do |code|
  case code
    when 'correct'
      @hotel_cloud.visitor_home_page.input_favorites_code_field.set @favorites_code
    when 'incorrect'
      @hotel_cloud.visitor_home_page.input_favorites_code_field.set @favorites_code+'234'
  end
  @hotel_cloud.visitor_home_page.load_favorites_button.click
end

When /^I copy url for import favorites$/  do
  @favorites_url = @hotel_cloud.visitor_home_page.favorites_url_field_value
end

When /^I proceed to '(.*)' imported favorites page$/ do |pages|
  case pages
    when 'correct'
      page.visit @favorites_url
    when 'incorrect'
      page.visit @favorites_url+'1'
  end

end

When /^I confirm import$/ do
  @hotel_cloud.visitor_home_page.confirm_favorites_import_button.click
end

Then /^I should( not)? see 'Favorites' button on guest page$/ do |negate|
  button = @hotel_cloud.visitor_home_page.has_favorites_folder_button?
  negate ? button.should(be_falsey) : button.should(be_truthy)
end

Then /^I should( not)? see 'Remove Favorites' button on \[Settings\] page$/ do |negate|
  button = @hotel_cloud.visitor_home_page.has_remove_favorites?
  negate ? button.should(be_falsey) : button.should(be_truthy)
end

Then /^I should see '(.*)' link$/ do |link|
  @hotel_cloud.visitor_home_page.choose_room_link.text.eql? link
end

Then /^I should see available languages:$/ do |table|

  table.hashes.each do |languages|

    language = languages[:language]

    @hotel_cloud.visitor_home_page.header.language_name(language).should(be_visible)
  end

end

Then /^I should see '(.*)' format of temperature$/ do |temp|
  expect(@hotel_cloud.weather_pop_up.current_temp).to have_content(temp)
end

Then /^I should( not)? see visitor home page$/ do |negate|
  button = @hotel_cloud.visitor_home_page.header.has_home_button?
  negate ? button.should(be_falsey) : button.should(be_truthy)
end

Then(/^I should see '(.*)' user name on the visitor page$/) do |name|
  expect(@hotel_cloud.visitor_home_page.header.user_name).to have_content(unique_value(name))
end

Then /^I should see '(.*)' message from staff$/ do |message|
  @confirm_message.should eql(message)
end

Then /^I should see '(.*)' notice$/ do |message|
  @hotel_cloud.request_details_pop_up.notice.text.eql? message
end

Then /^I should not see choose room link$/ do
  @hotel_cloud.visitor_home_page.should have_no_choose_room_link
end

Then(/^I should see '(.*)' error message at \[Settings\] section$/) do |message|
  case message
    when 'existing email'
      expect(@hotel_cloud.visitor_home_page.email_error).to have_content('email has already been taken')
    when 'invalid email'
      expect(@hotel_cloud.visitor_home_page.email_error).to have_content('email is invalid,does not appear to be a valid e-mail address')
    when 'empty email'
      expect(@hotel_cloud.visitor_home_page.email_error).to have_content("email can't be blank")
    when 'Invalid Code'
      expect(@hotel_cloud.visitor_home_page.import_error).to have_content("Favorites code: Invalid Code")
    else
      raise ArgumentError.new "message: #{message} is not supported"
  end
end

Then(/^I should see '(.*)' email in the user email field$/) do |email|
  @hotel_cloud.visitor_home_page.email_field_value.eql? unique_email(email)
end

Then(/^I should see '(.*)' page$/) do |title|
  @hotel_cloud.resend_confirmation_page.title.text.eql? title
end

Then(/^I should( not?) see \[Weather\] pop up/) do |negate|
  sleep 2
  popup = @hotel_cloud.visitor_home_page.has_weather_popup?
  negate ? popup.should(be_falsey) : popup.should(be_truthy)
end

Then /^I should see '(.*)' breadcrumb$/ do |name|
  expect(page).to have_selector(@hotel_cloud.visitor_home_page.breadcrumb, :text => unique_value(name))
end

Then /^I should( not)? see '(.*)' text on \[Favorites\] button$/ do |negate, button|
  @hotel_cloud.visitor_home_page.favorites_folder_button.text eql? button
  negate ? button.should(be_falsey) : button.should(be_truthy)
end

Then /^I see '(.*)' thumbnail leads on '(.*)' page$/ do |item, link|
  href = @hotel_cloud.visitor_home_page.item_href unique_value(item)
  if link == 'test env'
    link = "#{(EnvConfig.get :url)}/"
    href.should include link
  else
    href.should == link
  end
end

Then /^I should see '(.*)' button in header$/ do |button|
  @hotel_cloud.visitor_home_page.header.requests_button.text.should eql(button)
end