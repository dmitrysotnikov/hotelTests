class PaymentPopUp  < SitePrism::Page

  element :save_button, '.mu-button2.pull-right'
  element :cancel_button, '.pull-left.mu-button1'
  element :card_number_field, '[placeholder="Card Number"]'
  element :expires_field, '.cc-exp'
  element :name_on_card_field, '[placeholder="Name on Card"]'
  element :cvc_field, '[placeholder="CVC"]'
  element :email_field, '#invoice-email'

end