class ServicePopUp < SitePrism::Page

  element :place_service_order, '.mu-button2'
  element :add_service_to_order_button, '.btn-primary.mu-btn3'
  element :header, '.mu-modal-header h3'
  element :unit_price, '.pull-left.hidden-phone'
  element :plus_amount_button, '.btn.mu-plus-minus.up'
  element :minus_amount_button, '.btn.mu-plus-minus.down'
  element :calendar_button, '.btn.datetime-input.mu-goto-requests.mu-button1'
  element :place_order_from_folder_button, '.btn.btn-primary.btn-block.mu-btn.mu-apply-button.mu-order-btn'
  element :calendar_for_folder, '.datetime-input.btn.btn-block.mu-btn.mu-time-btn'
  element :section, '.mu-section.row-fluid>fieldset>legend'
  element :price, '.pull-left.hidden-phone'
  element :total_price, '.span3.mobile-spn6.app-request-item-total'
  element :call_button, '.btn-info>.value'
  element :tax_perc, '.mu-tax'
  element :title, 'h4'
  element :service_title, '.mu-modal-header>h3'
  element :description, '.app-description>p'
  element :feature, '.mu-bullets li'
  element :open_button, '.launch-link'
  element :google_map, '.google-maps'
  element :pickup_address_field, '[name="pickup[address]"]'
  element :drop_off_address_field, '[name="dropoff[address]"]'
  element :pickup_time_field, '.datetimepicker>.form-control'
  element :notes_field, '[name="comment"]'
  element :order_button, '[type="submit"]'
  element :amount_section, '.spinner-input'
  element :options_items_service, '.dk_toggle.dk_label'
  element :options_items_list, '.dk_options_inner'
  element :additional_item_name, '.items .mobile-spn6'
  element :items_section, '.items'



  def section_name_value
    section['textContent']
  end

  def tax_percentage_value
    tax_perc['textContent']
  end

  def add_service_to_order_value
    add_service_to_order_button['textContent']
  end

  def item_price(item)
    find(:xpath, "//div[contains(@class, 'mobile-spn6 span7') and text()='#{item}']/../div[contains(@class, 'mobile-spn2')]")
  end

  def item_price_content(item)
    item_price(item)['textContent']
  end

  def additional_item_name_value
    additional_item_name['textContent']
  end

  def additional_item_price(additional_item_name)
    find(:xpath, "//*[text()='#{additional_item_name}']/../div[3]")['textContent']
  end

  def additional_item_text_value(additional_item_text)
    find(:xpath, "//*[@class='items']//*[text()='#{additional_item_text}']")
  end

  def total_price_value
    total_price['textContent']
  end

  def price_value
    price['textContent']
  end

  def open_href
    open_button['href']
  end

end