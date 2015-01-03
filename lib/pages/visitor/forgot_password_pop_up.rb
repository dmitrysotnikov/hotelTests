class ForgotPasswordPopUp  < SitePrism::Page

  element :email_field, '#email'
  element :reset_password_button, '[value="Reset"]'
  element :visitor_password_field, '#visitor_password'
  element :visitor_password_confirmation_field, '#visitor_password_confirmation'
  element :change_password_button, '[value="Change"]'
  element :error_explanation_notice, '#error_explanation'
  element :error_notification, '.help-inline.error'

  def change_password(password, confirm_password)
    visitor_password_field.set password
    visitor_password_confirmation_field.set confirm_password
    change_password_button.click
  end
end