class AccountCreatePopUp < SitePrism::Page

  element :first_name_field, '#first_name'
  element :last_name_field, '#last_name'
  element :email_field, '#email'
  element :password_field, '#password'
  element :password_confirmation_field, '#password_confirmation'
  element :create_an_account_button, '.form-actions .btn-primary'
  element :email_error, '#email+.error'
  element :password_error, '#password+.error'
  element :room_error, '#stay_room+.error'

end