class GoogleLoginPage < SitePrism::Page

  element :email_field, '#Email'
  element :password_field, '#Passwd'
  element :login_button, '#signIn'

  def login_as_existing_hotel_user(email, password)
    email_field.set email
    password_field.set password
    login_button.click
  end

end