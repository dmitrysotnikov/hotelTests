Given /^I am login to backend as '(.*)'$/ do |username|

  password = EnvConfig.get :default_password

  @hotel_cloud = HotelCloud.new
  @hotel_cloud.login_staff_page.load
  @hotel_cloud.staff_base_page.logout_button.click if @hotel_cloud.staff_base_page.has_logout_button?
  @hotel_cloud.staff_base_page.wait_until_logout_button_invisible
  sleep 3
  @hotel_cloud.login_staff_page.login_as username, password
  @hotel_cloud.staff_manager_page.wait_until_new_staff_button_visible
end

Given /^I am login to backend as staff$/ do

  username = EnvConfig.get :email
  password = EnvConfig.get :default_password

  @hotel_cloud = HotelCloud.new
  @hotel_cloud.login_staff_page.load
  @hotel_cloud.staff_manager_page.header.logout_button.click if @hotel_cloud.staff_manager_page.has_header?
  @hotel_cloud.staff_manager_page.wait_until_header_invisible
  page.driver.browser.manage.delete_all_cookies
  page.driver.browser.navigate.refresh
  @hotel_cloud.login_staff_page.login_as username, password
end

 Given /^I am login to backend as '(.*)' with '(.*)' password$/ do |username, password|

  @hotel_cloud = HotelCloud.new
  @hotel_cloud.login_staff_page.load
  @hotel_cloud.staff_manager_page.header.logout_button.click if @hotel_cloud.staff_manager_page.has_header?
  @hotel_cloud.staff_manager_page.wait_until_header_invisible
  page.driver.browser.manage.delete_all_cookies
  page.driver.browser.navigate.refresh
  @hotel_cloud.login_staff_page.login_as unique_email(username), password
  @hotel_cloud.staff_manager_page.wait_until_new_staff_button_visible
end

Given /^I am login to backend as vendor$/ do

  username = EnvConfig.get :vendor_email
  password = EnvConfig.get :vendor_password

  @hotel_cloud = HotelCloud.new
  @hotel_cloud.vendor_login_page.load
  page.driver.browser.manage.delete_all_cookies
  page.driver.browser.navigate.refresh
  @hotel_cloud.staff_manager_page.header.logout_button.click if @hotel_cloud.staff_manager_page.has_header?
  @hotel_cloud.staff_manager_page.wait_until_header_invisible
  sleep 3
  @hotel_cloud.login_staff_page.login_as username, password
end

Given /^I am on login visitor page$/ do
  @hotel_cloud = HotelCloud.new
  @hotel_cloud.login_visitor_page.load
  @hotel_cloud.login_visitor_page.wait_until_start_up_image_visible
end

When /^I am on login staff page$/ do
  @hotel_cloud.login_staff_page.load
end

When /^I login as '(.*)' user with '(.*)' password$/ do   |email, password|
  page.driver.browser.manage.delete_all_cookies
  @hotel_cloud.login_visitor_page.load
  @hotel_cloud.login_visitor_page.wait_until_email_field_visible
  page.driver.browser.navigate.refresh
  @hotel_cloud.login_visitor_page.wait_until_email_field_visible
  @hotel_cloud.login_visitor_page.email_field.set unique_email email
  @hotel_cloud.login_visitor_page.pass_field.set password
  @hotel_cloud.login_visitor_page.login_button.click
  @hotel_cloud.login_visitor_page.wait_until_email_field_invisible
  sleep 1
end

When /^I fill login form using '(.*)' email and '(.*)' password$/ do   |email, password|
  @hotel_cloud.login_visitor_page.email_field.set unique_email(email)
  @hotel_cloud.login_visitor_page.pass_field.set password
end

When /^I fill '(.*)' login form using '(.*)' email and '(.*)' password$/ do   |social, email, password|
  case social
    when 'Facebook'
      @hotel_cloud.fb_login_page.login_as_existing_hotel_user(email, password)
    when 'Google'
      @hotel_cloud.google_login_page.login_as_existing_hotel_user(email, password)
    when 'Linkedin'
      @hotel_cloud.in_login_page.login_as_existing_hotel_user(email, password)
    when 'Foursquare'
      @hotel_cloud.foursquare_login_page.login_as_existing_hotel_user(email, password)
    else
      raise ArgumentError.new "social: #{social} is not supported"
  end
end

When (/^I login as newly created user with following data:$/) do |table|

  table.hashes.each do |api_user|
    first_name = api_user[:first_name]
    last_name = api_user[:last_name]
    email = api_user[:email]

    hotel_cloud_api = HotelCloudApi.new
    hotel_cloud_api.create_user(unique_email(email), first_name, unique_value(last_name))
    @hotel_cloud.login_visitor_page.load
    @hotel_cloud.login_visitor_page.email_field.set unique_email email
    @hotel_cloud.login_visitor_page.pass_field.set EnvConfig.get(:email_password)
    @hotel_cloud.login_visitor_page.login_button.click
  end
end

When /^I look to the startup image$/ do
  @old_image = @hotel_cloud.login_visitor_page.start_up_image_name
end

When /^I fill your information popup with following data:$/ do  |table|

  table.hashes.each do |service|

    first_name = service[:first_name]
    @last_name = service[:last_name]
    email = service[:email]
    password = service[:password]
    password_confirmation = service[:password_confirmation]

    @hotel_cloud.account_create_pop_up.first_name_field.set first_name if first_name
    @hotel_cloud.account_create_pop_up.last_name_field.set unique_value @last_name if @last_name
    @hotel_cloud.account_create_pop_up.email_field.set unique_email email if email
    @hotel_cloud.account_create_pop_up.password_field.set password if password
    @hotel_cloud.account_create_pop_up.password_confirmation_field.set password_confirmation if password_confirmation
    @hotel_cloud.account_create_pop_up.create_an_account_button.click
    begin
      @hotel_cloud.your_information_pop_up.wait_until_register_my_stay_button_visible
    rescue Exception => e
      sleep 2
    end
  end
end

When(/^I select '(.*)' radiobutton/) do |button|
  case button
    when 'I dont have a room'
      @hotel_cloud.your_information_pop_up.dont_have_room_radiobutton.click
    when 'I am a guest'
      @hotel_cloud.your_information_pop_up.guest_radiobutton.click
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
end

When /^I fill '(.*)' room number$/ do |room|
  @hotel_cloud.your_information_pop_up.wait_until_stay_room_field_visible
  @hotel_cloud.your_information_pop_up.guest_radiobutton.click
  case room
  when 'random'
    @room = Faker::Number.number(5)
    @hotel_cloud.your_information_pop_up.stay_room_field.set @room
    when 'random+1'
    @hotel_cloud.your_information_pop_up.stay_room_field.set (@room+"1")
  else
    @hotel_cloud.your_information_pop_up.stay_room_field.set room
  end
end

When /^I fill the same room number$/ do
  @hotel_cloud.your_information_pop_up.guest_radiobutton.click
  @hotel_cloud.your_information_pop_up.stay_room_field.set @room
end

When (/^I click \['(.*)'\] button at \[Login\] page$/) do |button|
  case button
    when 'Create Account'
      @hotel_cloud.login_visitor_page.create_account_button.click
    when 'Login'
      @hotel_cloud.login_visitor_page.login_button.click
    when 'Forgot Password'
      @hotel_cloud.login_visitor_page.forgot_pass_button.click
    when 'Cancel'
      @hotel_cloud.login_visitor_page.cancel_button.click
    when 'Facebook'
      @hotel_cloud.login_visitor_page.facebook_button.click
    when 'Foursquare'
      @hotel_cloud.login_visitor_page.foursquare_button.click
    when 'Google'
      @hotel_cloud.login_visitor_page.google_button.click
    when 'Linkedin'
      @hotel_cloud.login_visitor_page.linkedin_button.click
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
  sleep 1
end

When (/^I reset password for existing '(.*)' user$/) do |email|
  @hotel_cloud.forgot_password_popup.email_field.set unique_email email if email
  @hotel_cloud.forgot_password_popup.reset_password_button.click
  page.driver.browser.switch_to.alert.accept
  sleep 2
end

When (/^I reset password for non existing '(.*)' user$/) do |email|
  @hotel_cloud.forgot_password_popup.email_field.set unique_email email if email
  @hotel_cloud.forgot_password_popup.reset_password_button.click
end

When (/^I click \['(.*)'\] button at \[Do you have a room\] section$/) do |button|
  case button
    when 'Yes'
      @hotel_cloud.login_visitor_page.yes_room_button.click
    when 'No'
      @hotel_cloud.login_visitor_page.no_room_button.click
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
end

When /^I press '(.*)' button on your information popup$/ do  |button|
  case button
    when 'Cancel'
      @hotel_cloud.your_information_pop_up.cancel_button.click
    when 'Register my stay'
      sleep 2
      @hotel_cloud.your_information_pop_up.register_my_stay_button.click
  end
  begin
    @hotel_cloud.your_information_pop_up.wait_until_register_my_stay_button_invisible
  rescue Exception => e
    sleep 5
  end
end

When /^I use '(.*)' pin to login$/ do |pin|
  @hotel_cloud.welcome_pop_up.submit_form pin
end

When(/^I should see '(.*)' notification on '(.*)' popup$/)  do |notification, popup|
  case popup
    when 'Reset my password'
      expect(@hotel_cloud.forgot_password_popup.error_notification).to have_content(notification)
    when 'Password change'
      expect(@hotel_cloud.forgot_password_popup.error_explanation_notice).to have_content(notification)
    else
      raise ArgumentError.new "popup: #{popup} is not supported"
  end
end

When /^I fill room and dates info using the following data:$/ do |table|

  table.hashes.each do |guest|
    room = guest[:room]
    check_in = guest[:check_in]
    check_out = guest[:check_out]

    #fill form
    if room
      @hotel_cloud.your_information_pop_up.guest_radiobutton.click
      case room
        when 'random'
          @room = Faker::Number.number(5)
          @hotel_cloud.your_information_pop_up.stay_room_field.set @room
        when 'random+1'
          @hotel_cloud.your_information_pop_up.stay_room_field.set (@room+"1")
        else
          @hotel_cloud.your_information_pop_up.stay_room_field.set room
      end
    end
    @hotel_cloud.your_information_pop_up.set_check_in_date convert_date(check_in) if check_in
    @hotel_cloud.your_information_pop_up.set_check_out_date convert_date(check_out) if check_out
  end
end

When /^I logout from staff account$/ do
  @hotel_cloud = HotelCloud.new
  @hotel_cloud.content_manager_page.header.wait_until_logout_button_visible
  @hotel_cloud.content_manager_page.header.logout_button.click
  @hotel_cloud.login_staff_page.wait_until_sign_in_button_visible
end

Then /^I should see '(.*)' in the request button$/ do |number|
  @hotel_cloud.visitor_home_page.header.count_of_request.text.should eql(number)
end

Then(/^I should see '(.*)' room on the visitor page$/) do |room|

    room = "ROOM #{@room}" if room.eql? 'random'
    room = "ROOM #{@room +"1"}" if room.eql? 'random+1'
    expect(@hotel_cloud.visitor_home_page.header.room_number).to have_content(room)
end

Then /^I should see updated startup image$/ do
  @hotel_cloud.login_visitor_page.start_up_image_name.should_not eql(@old_image)
end

Then(/^I should( not)? see \['(.*)'\] button$/) do |negate, button|
  case button
    when 'Home'
      visible = @hotel_cloud.visitor_home_page.header.has_home_button?
    when 'Account Settings'
      visible = @hotel_cloud.visitor_home_page.header.has_settings_button?
    when 'Request'
      visible = @hotel_cloud.visitor_home_page.header.has_requests_button?
    when 'Login'
      but = @hotel_cloud.visitor_home_page.login_button_xpath
      visible = element_visible?(but)
    when 'Register my Stay'
      but = @hotel_cloud.your_information_pop_up.register_my_stay_button_xpath
      visible = element_visible?(but)
    when 'Butler'
      but = @hotel_cloud.visitor_home_page.butler_button_xpath
      visible = element_visible?(but)
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end

Then /^I should( not)? see 'Login' button on login page$/ do |negate|
  visible = element_visible?(@hotel_cloud.login_visitor_page.login_button_on_page_xpath)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end


Then(/^I should see '(.*)' error message$/) do |condition|
  case condition
    when 'existing email'
      @hotel_cloud.account_create_pop_up.email_error.text.should eql('has already been taken')
    when 'invalid email'
      @hotel_cloud.account_create_pop_up.email_error.text.should eql('is invalid, does not appear to be a valid e-mail address')
    when 'short password'
      @hotel_cloud.account_create_pop_up.password_error.text.should eql('is too short (minimum is 6 characters)')
    when "doesn't match password"
      @hotel_cloud.account_create_pop_up.password_error.text.should eql("doesn't match confirmation")
    when "short + doesn't match password"
      @hotel_cloud.account_create_pop_up.password_error.text.should eql("doesn't match confirmation, is too short (minimum is 6 characters)")
    when 'same room'
      @hotel_cloud.account_create_pop_up.room_error.text.should eql('The specified room is occupied!')
    when 'invalid email or password'
      @hotel_cloud.login_visitor_page.login_error.text.should eql('Invalid email or password.')
    else
      raise ArgumentError.new "condition: #{condition} is not supported"
  end
end