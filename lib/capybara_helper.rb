module CapybaraHelper

  def wait_for_ajax_requests
    wait_until { page.evaluate_script('jQuery.active === 0') }
  rescue Timeout::Error
    raise 'Ran out of time waiting for Ajax.requests to be empty.'
  end

  def element_visible?(xpath_locator)
    element_present?(xpath_locator) && element_displayed?(xpath_locator)
  end

  private

  def wait_until
    require "timeout"
    Timeout.timeout(Capybara.default_wait_time) do
      sleep(0.1) until value = yield
      value
    end
  end

  def element_present?(xpath_locator)
    page.has_xpath?(xpath_locator)
  end

  def element_displayed?(xpath_locator)
    find(:xpath, xpath_locator).visible?
  end

  def interact_with_checkbox(checkbox, action)
    if action == 'checked'
      check_checkbox(checkbox)
    else
      if action == 'unchecked'
        uncheck_checkbox(checkbox)
      end
    end
  end

  def check_checkbox(checkbox)
    if checkbox['checked'].nil?
      checkbox.click
    end
  end

  def uncheck_checkbox(checkbox)
    unless checkbox['checked'].nil?
      checkbox.click
    end
  end

end