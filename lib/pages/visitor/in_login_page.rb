class InLoginPage < SitePrism::Page

  element :email_field, "[name='session_key']"
  element :password_field, "[name='session_password']"
  element :login_button, '.allow'

  def login_as_existing_hotel_user(email, password)
    email_field.set email
    password_field.set password
    login_button.click
  end

end