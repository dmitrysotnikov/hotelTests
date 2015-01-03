class LoginVisitorPage < SitePrism::Page

  set_url '/#login'

  element :login_button, '#new_visitor .btn.btn-primary'
  element :email_field, '#visitor_email'
  element :pass_field, '#visitor_password'
  element :create_account_button, '[href="#visitors/sign_up"]'
  element :forgot_pass_button, '[href="#visitors/password/new"]'
  element :yes_room_button, '.app-has-room'
  element :no_room_button, '.app-no-room'
  element :start_up_image, '.mu-sign-in.mu-login'
  element :facebook_button, '.fa-facebook'
  element :foursquare_button, '.fa-foursquare'
  element :google_button, '.fa-google-plus'
  element :linkedin_button, '.fa-linkedin'
  element :cancel_button, '.mu-cancel'
  element :login_error, '.help-block'

  def login_button_on_page_xpath
    ".//button[@class='btn btn-primary']"
  end

  def login_as(email, pass)
    email_field.set email
    pass_field.set pass
    login_button.click
  end

  def start_up_image_name
    start_up_image['style']
  end

end