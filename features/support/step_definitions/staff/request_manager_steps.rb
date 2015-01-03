When /^I '(.*)' '(.*)' request with '(.*)' status on the requests list$/ do |button, request, status|
  name = "#{@room}/#{unique_value(@last_name)}"
  @hotel_cloud.request_manager_page.room_guest(status, request, name)

  case button
    when 'Confirm auto-registration'
      @hotel_cloud.request_details_pop_up.confirm_button.click
      sleep 5
    when 'Confirm service'
      @hotel_cloud.request_details_pop_up.confirm_button.click
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Confirm and change room'
      @hotel_cloud.add_guest_pop_up.room_field.set (@room +"1")
      @hotel_cloud.request_details_pop_up.confirm_button.click
    when 'Reject'
      @hotel_cloud.request_details_pop_up.reject_button.click
      page.driver.browser.switch_to.alert.accept
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Close Window'
      @hotel_cloud.request_details_pop_up.close_window.click
    when 'Handle this request'
      @hotel_cloud.request_details_pop_up.handle_request_button.click
      sleep 2
      @hotel_cloud.request_details_pop_up.x_button.click
      sleep 2
    when 'Accept'
      @hotel_cloud.request_details_pop_up.accept_button.click
    when 'Archive'
      @hotel_cloud.request_details_pop_up.archive_button.click
      @hotel_cloud.request_details_pop_up.x_button.click
    else
      raise ArgumentError.new "button: #{action} is not supported"
  end
end

When /^As vendor I '(.*)' '(.*)' request with '(.*)' status on the requests list$/ do |button, request, status|
  name = "testalex/#{unique_value(@last_name)}"
  @hotel_cloud.request_manager_page.room_guest(status, request, name)

  case button
    when 'Confirm service'
      @hotel_cloud.request_details_pop_up.confirm_button.click
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Reject'
      @hotel_cloud.request_details_pop_up.reject_button.click
      page.driver.browser.switch_to.alert.accept
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Close Window'
      @hotel_cloud.request_details_pop_up.close_window.click
    when 'Handle this request'
      @hotel_cloud.request_details_pop_up.handle_request_button.click
      sleep 2
      @hotel_cloud.request_details_pop_up.x_button.click
      sleep 2
    when 'Accept'
      @hotel_cloud.request_details_pop_up.accept_button.click
    when 'Archive'
      @hotel_cloud.request_details_pop_up.archive_button.click
      @hotel_cloud.request_details_pop_up.x_button.click
    else
      raise ArgumentError.new "button: #{action} is not supported"
  end
end

When /^I get status after '(.*)' created request with '(.*)' status on the requests list$/ do |button, status|
  name = "#{@room}/#{unique_value(@last_name)}"
  @hotel_cloud.request_manager_page.room_guest(status, request, name)

  case button
    when 'Confirm'
      @hotel_cloud.request_details_pop_up.confirm_button.click
      @hotel_cloud.add_guest_pop_up.save_button.click
      sleep 2
      @confirm_message = @hotel_cloud.request_details_pop_up.confirm_message.text
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Reject'
      @hotel_cloud.request_details_pop_up.reject_button.click
      page.driver.browser.switch_to.alert.accept
      @confirm_message = @hotel_cloud.request_details_pop_up.confirm_message.text
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Close Window'
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Handle this request'
      @hotel_cloud.request_details_pop_up.handle_request_button.click
      @hotel_cloud.request_details_pop_up.x_button.click
    when 'Accept'
      @hotel_cloud.request_details_pop_up.accept_button.click
    when 'Archive'
      @hotel_cloud.request_details_pop_up.archive_button.click
      @hotel_cloud.request_details_pop_up.x_button.click
    else
      raise ArgumentError.new "button: #{action} is not supported"
  end
  @confirm_message
end

When /^I open '(.*)' request with '(.*)' status$/ do |request, status|
  name = "#{@room}/#{unique_value(@last_name)}"
  #sleep 3
  @hotel_cloud.request_manager_page.room_guest(status, unique_value(request), name)
end

When /^I archive '(.*)' requests$/ do |request|
  sleep 2
  @i = 0
  @num = 5
  begin
    case request
      when "new"
        sleep 2
        @hotel_cloud.request_manager_page.new_first_request.click
        if @hotel_cloud.request_details_pop_up.has_handle_request_button?
          @hotel_cloud.request_details_pop_up.handle_request_button.click
          @hotel_cloud.request_details_pop_up.confirm_button.click
          @hotel_cloud.request_details_pop_up.archive_button.click
        else
          @hotel_cloud.request_details_pop_up.confirm_button.click
        end
        sleep 2
      when "current"
        @hotel_cloud.request_manager_page.current_first_request.click
        @hotel_cloud.request_details_pop_up.confirm_button.click
        @hotel_cloud.request_details_pop_up.archive_button.click
        sleep 2
      when "past"
        @hotel_cloud.request_manager_page.past_first_request.click
        @hotel_cloud.request_details_pop_up.archive_button.click
        sleep 2
    end
  end until @i > @num
end

When /^I press '(.*)' button on request details popup$/ do |button|
  case button
    when 'Confirm'
      @hotel_cloud.request_details_pop_up.confirm_button.click
    when 'Reject'
      @hotel_cloud.request_details_pop_up.reject_button.click
    when 'Close Window'
      @hotel_cloud.request_details_pop_up.close_window.click
      @hotel_cloud.request_details_pop_up.wait_until_request_popup_invisible
    when 'Handle this request'
      @hotel_cloud.request_details_pop_up.handle_request_button.click
    when 'Archive'
      @hotel_cloud.request_details_pop_up.archive_button.click
    else
      raise ArgumentError.new "button: #{action} is not supported"
  end

end

When /^I press '(.*)' for 'Show All' checkbox$/ do |checkbox|
  @hotel_cloud.request_manager_page.show_all_checkbox.set(checkbox.to_bool) if checkbox
  page.driver.browser.navigate.refresh
  sleep 5
end

Then /^I should( not)? see '(.*)' request with '(.*)' status$/ do |negate, request, status|

  name = "#{@room}/#{unique_value(@last_name)}"
  item = @hotel_cloud.request_manager_page.room_guest_present(status, request, name)
  negate ? item.should_not(be_visible) : item.should(be_visible)
end

Then /^As vendor I should( not)? see '(.*)' request with '(.*)' status$/ do |negate, request, status|

  name = "testalex/#{unique_value(@last_name)}"
  item = @hotel_cloud.request_manager_page.room_guest_present(status, request, name)
  negate ? item.should_not(be_visible) : item.should(be_visible)
end