class HeaderSection < SitePrism::Section

  element :logout_button, '[href="/staff/sign_out"]'
  element :new_element, :xpath, './/tr[1]'
  element :guest_view_link, '.login li:first-child a'
  element :staff_manager_tab, '[href="/staff/users"]'
  element :guest_manager_tab, '[href="/staff/stays"]'
  element :content_manager_tab, '[href="/staff/content"]'
  element :request_manager_tab, '[href="/staff/service_requests"]'
  element :hotel_settings_tab, '[href="/staff/settings/edit"]'
  element :user_preferences_tab, '[href="/staff/account/edit"]'

  def press_tab(name)
    find(:xpath, "//a[contains(text(),'#{name}')]").click
  end

end