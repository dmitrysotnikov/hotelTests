class LoginStaffPage < SitePrism::Page

  set_url "/staff/users"

  element :email_field, '#user_email'
  element :password_field, '#user_password'
  element :sign_in_button, '[value="Sign in"]'

  def login_as(email, password)
    email_field.set email
    password_field.set password
    sign_in_button.click
  end

end
