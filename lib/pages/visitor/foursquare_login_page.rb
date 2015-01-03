class FoursquareLoginPage < SitePrism::Page

  element :email_field, '#username'
  element :password_field, '#password'
  element :login_button, '#loginFormButton'

  def login_as_existing_hotel_user(email, password)
    email_field.set email
    password_field.set password
    login_button.click
  end
end