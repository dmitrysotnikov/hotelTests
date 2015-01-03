class NewStaffMemberPage < SitePrism::Page

  element :staff_manager_checkbox, '[value="staff_manager"]'
  element :service_manager_checkbox, '[value="service_manager"]'
  element :request_manager_checkbox, '[value="request_manager"]'
  element :first_name_field, '[name="first_name"]'
  element :last_name_field, '[name="last_name"]'
  element :phone_field, '[name="phone"]'
  element :email_field, '[name="email"]'
  element :password_field, '[name="password"]'
  element :close_button, '.close'
  element :save_button, '[type="submit"]'
end
