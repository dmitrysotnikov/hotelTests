class GuestManagerPage < SitePrism::Page

  set_url '/staff/visitors'

  element :new_guest_button, '.js-add'
  element :checkout_checkbox, '[name="include_expired"]'
  element :checkout_button, '.js-checkout'
  section :header, HeaderSection, '#navbar-collapse-1'



  def all_values_from_row(room)
    sleep 2
    row = page.all(:xpath, "//div[text()=\"#{room}\"]/../div")
    columns = {
        last_name: row[0].text,
        room: row[1].text,
        check_in_date: row[2].text.split('@').first.strip,
        check_out_date: row[3].text.split('@').first.strip,
        status: row[4].text
    }
  end

  def guest(name, status)
    # find(:xpath, "//span[contains(.,'#{name}')]/../..//span[text()='#{status}']")
    find(:xpath, "//*[text()='#{status}']/../..//*[text()='#{name}']")
  end

  def click_guest(name, status)
    guest(name, status).click
  end


end