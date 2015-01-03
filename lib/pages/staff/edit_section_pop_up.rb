class EditSectionPopUp < SitePrism::Page

  element :section_name_field, '.js-name'
  element :required_checkbox, '.js-required'
  element :add_feature_button, :xpath, "//*[@class='modal in'][@aria-hidden='false']/div[@class='modal-dialog']//*[text()='Add feature']"
  element :multiple_checkbox, '.js-multiple'
  element :close_button, :xpath, "//*[@aria-hidden='false']//*[text()='Close']"
  element :last_item_name_field, '[aria-hidden="false"] .feature-items>div:last-child  [name="name"]'
  element :last_item_price_field, '[aria-hidden="false"] .feature-items>div:last-child [name="price"]'
  element :last_item_enable_quantity_checkbox, '[aria-hidden="false"] .feature-items>div:last-child [name="multiple"]'
  element :last_delete_feature_button, '.feature-items>div:last-child .js-delete'

end