class RequestDetailsPopUp  < SitePrism::Page

  element :confirm_button, '.btn-success'
  element :reject_button, '.btn-danger'
  element :close_window, '.close'
  element :x_button, ".close"
  element :handle_request_button, '[data-action="handle"]'
  element :accept_button, '.accept.active'
  element :archive_button, '.btn-default'
  element :confirm_message, '.comment>span'
  element :request_popup, '.popup-holder.details'
  element :from_staff_message, '.mu-text'
  element :notice, '.flash-notice'
  element :tax, '.tax'
  element :delivery, '.delivery'
  element :total, '.total'

  def table_value(title, price)
    "//td[text()='#{price}']/ancestor::table//th[text()='#{title}']"
  end

  def tax_value
    tax['textContent']
  end

  def delivery_value
    delivery['textContent']
  end

  def total_value
    total['textContent']
  end


end
