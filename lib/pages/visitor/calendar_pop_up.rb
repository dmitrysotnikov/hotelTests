class CalendarPopUp < SitePrism::Page

  element :dove_save_button, '.app-save.btn.btn-primary'

  def select_day(date)
    find(:xpath, "//button[contains(.,'#{date}')]").click
  end

end