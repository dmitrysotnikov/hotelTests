class AddGuestPopUp < SitePrism::Page

  element :last_name_field, '[name="last_name"]'
  element :room_field, '[name="room"]'
  element :save_button, '[type="submit"]'
  element :close_button, '.fade .close'
  element :check_in_button, :xpath, ".//label[text()='Check In']//..//input[@type='text']"
  element :check_out_button, :xpath, ".//label[text()='Check Out']//..//input[@type='text']"

  element :check_ok_button, :xpath, ".//div[@class='controls']//button[@type='button']"

  def check_hours_time(hours)
    find(:xpath, ".//div[@class='controls']//select[@name='hours']/option[text()='#{hours}']")
  end

  def check_minutes_time(minutes)
    find(:xpath, ".//div[@class='controls']//select[@name='minutes']/option[text()='#{minutes}']")
  end

  def check_ampm_time(ampm)
    find(:xpath, ".//div[@class='controls']//select[@name='ampm']/option[text()='#{ampm}']")
  end

  def input_check_in_time(check_in_time)
    time = check_in_time.split(':')
    hours = time[0]
    value = time[1]
    array_time = value.split('')
    min = array_time[0]+array_time[1]
    ampm = array_time[2]+array_time[3]
    check_in_button.click
    check_hours_time(hours).click
    check_minutes_time(min).click
    case ampm
      when 'pm'
        check_ampm_time('PM').click
      when 'am'
        check_ampm_time('AM').click
    end
    check_ok_button.click
  end

  def input_check_out_time(check_out_time)
    time = check_out_time.split(':')
    hours = time[0]
    value = time[1]
    array_time = value.split('')
    min = array_time[0]+array_time[1]
    ampm = array_time[2]+array_time[3]
    check_out_button.click
    check_hours_time(hours).click
    check_minutes_time(min).click
    case ampm
      when 'pm'
        check_ampm_time('PM').click
      when 'am'
        check_ampm_time('AM').click
    end
    check_ok_button.click
  end

  def set_check_in(time1, time)
    page.execute_script("$(\"div.js-check-in div.controls.hide .visible-xs[value=\'#{time1}\']\").val(\'#{time}\').change();")
  end

  def set_check_out(time1, time)
    page.execute_script("$(\"div.js-check-out div.controls.hide .visible-xs[value=\'#{time1}\']\").val(\'#{time}\').change();")
  end

  def click_save_button
    find(:css, '.btn-save')
    page.execute_script("$('.btn-save').click();")
  end
end