class FBLoginPage < SitePrism::Page

  set_url '/auth/facebook'

  element :email_field, '#email'
  element :password_field, '#pass'
  element :login_button, '[name="login"]'

  def login_as_existing_hotel_user(email, password)
    email_field.set email
    password_field.set password
    login_button.click
  end

end