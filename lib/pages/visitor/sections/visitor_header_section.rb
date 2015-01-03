class VisitorHeaderSection < SitePrism::Section

  element :logout_button, '.mu-signout'
  element :login_button, '.mu-signin'
  element :home_button, '.app-nav-home'
  element :guest_view_button, '[href="/"]'
  element :staff_button, '.mu-subnav'
  element :weather_button, '.inner .forecast .mu-text'
  element :current_temp, '.row-fluid>h1>span'
  element :fahrenheit_button, '.fahrenheit.btn.btn-primary'
  element :celsius_button, '.celsius.btn.btn-primary'
  element :count_of_request, '.badge-important.mu-requests-count'
  element :requests_button, '.app-nav-requests'
  element :settings_button, '.app-account.mu-link.mu-btn2'
  element :room_number, :xpath, "//*[@class='fa fa-key']/.."
  element :user_name, :xpath, "//*[@class='mobile-spn6']//*[@class='fa fa-user']/.."

  def language_name(name)
    find(:xpath, "//a[@class='select-locale' and contains(.,'#{name}')]")
  end
end