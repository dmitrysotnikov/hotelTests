class RequestDetailsPage < SitePrism::Page
  element :request_status, '.pull-right.mu-request-status'
  element :request_body, '.mu-requests-thumb-inner'
  element :message_field, '.input-block-level'
  element :message_button, '.mu-btn3'
  element :send_button, '.btn.col-md-12'
  element :staff_message_field, '.app-message-input'
  element :action_status, "[align='center']>multiline"
  element :close_button, '.close'

  def request_name_status(name)
    find(:xpath, "//h5[text()='#{name}']/../*[@class='pull-right mu-request-status']")
  end

end