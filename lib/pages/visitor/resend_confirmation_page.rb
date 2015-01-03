class ResendConfirmationPage < SitePrism::Page

  element :email_field, "#visitor_email"
  element :title, "h2"
  element :resend_button, "[name='commit']"

end