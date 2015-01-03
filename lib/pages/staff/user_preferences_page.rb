class UserPreferencesPage < SitePrism::Page

  element :current_pass,     '#user_current_password'
  element :pass,             '#user_password'
  element :pass_confirm,     '#user_password_confirmation'
  element :save_pref_button, '.btn'
  element :butler_requests_email, '[value="36456"]'
  element :auto_register_email_checkbox, '[value="33717"]'
  element :transportation_email_checkbox, '[value="38455"]'
  element :home_line_checkbox, :xpath, '//*[@value="33714"]/ancestor::li'
  section :header, HeaderSection, '.header'
end