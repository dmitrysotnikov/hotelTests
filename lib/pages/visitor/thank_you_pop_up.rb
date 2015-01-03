class ThankYouPopUp < SitePrism::Page

  element :done_button, '.mu-save-button'
  element :go_to_requests_button, '.btn.btn-primary.app-requests'
  element :order_status, '.inner>h4'
  element :popup, '.mu-thank-you'

end