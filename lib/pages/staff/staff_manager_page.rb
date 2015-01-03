class StaffManagerPage < SitePrism::Page

  set_url '/staff/users'

  element :new_staff_button, '.js-add'
  section :header, HeaderSection, '#navbar-collapse-1'

  def all_values_from_row(email)
    row = page.all(:xpath, "//td[text()=\"#{email}\"]/../td")
    columns = {
        first_name: row[0].text.split(' ').first,
        last_name: row[0].text.split(' ').last,
        email: row[1].text,
        phone: row[2].text,
        registered: row[3].text
    }
  end

  def select_manager(email)
    page.find(:xpath, "//td[text()=\"#{email}\"]/..").click
  end

end
