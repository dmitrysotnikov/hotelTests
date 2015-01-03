class WelcomePopUp < SitePrism::Page

  element :pin_field, '#visitor_pin'
  element :login_button, '[value="LOG IN"]'

  def submit_form(pin)
    pin_field.set pin
    login_button.click
  end

end