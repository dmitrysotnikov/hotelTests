When (/^I fill \[Main\] tab in \[Add Service Item\] form using the following data:$/) do |table|

  table.hashes.each do |service|

    title = service[:title]
    hint = service[:hint]
    image = service[:image]
    price = service[:price]
    enable_quantity = service[:enable_quantity]
    description = service[:description]
    language =  service[:language]
    title_lang = service[:title_lang]
    hint_lang = service[:hint_lang]
    template = service[:template]
    price_policy = service[:price_policy]
    item_title = service[:item_title]

    step "I click ['Add Service'] button at content page"

    # fill 'Main' tab
    @hotel_cloud.add_service_item_page.title_field.set unique_value title if title
    @hotel_cloud.add_service_item_page.hint_field.set unique_value hint if hint
    @hotel_cloud.add_folder_page.actions.select_language select language if language
    @hotel_cloud.add_service_item_page.input_service_name(languages[language]).set unique_value title_lang if title_lang
    @hotel_cloud.add_service_item_page.input_service_hint(languages[language]).set unique_value hint_lang if hint_lang
    @hotel_cloud.add_service_item_page.type_item_title item_title if item_title
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_service_item_page.select_template.select template if template
    @hotel_cloud.add_service_item_page.select_policy.select price_policy if price_policy
    @hotel_cloud.add_service_item_page.item_price_field.set price if price
    interact_with_checkbox(@hotel_cloud.add_service_item_page.enable_quantity_checkbox, enable_quantity) if enable_quantity
    @hotel_cloud.add_service_item_page.type_description description if description
  end
end


When (/^In \[Add Service Item\] pop up i click '(.*)' button for \[Features\] tab$/) do |button|

  case button
    when 'Add Feature'
      @hotel_cloud.add_service_item_page.add_feature_button.click
    when 'Add text input'
      @hotel_cloud.add_service_item_page.add_text_input_button.click
    when 'Add section'
      @hotel_cloud.add_service_item_page.add_section_button.click
    when 'Last section edit button'
      @hotel_cloud.add_service_item_page.last_section_edit_button.click
    when 'Last section delete button'
      @hotel_cloud.add_service_item_page.last_section_delete_button.click
    when 'Last additional item delete button'
      @hotel_cloud.add_service_item_page.last_additional_item_delete_button.click
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
end

When (/^I fill \[Features\] tab in \[Add Service Item\] form using the following data:$/) do |table|

  table.hashes.each do |section|

    title = section[:title]
    required = section[:required]
    multiple = section[:multiple]
    item_name = section[:item_name]
    quantity = section[:quantity]
    price = section[:price]

    @hotel_cloud.edit_section_pop_up.section_name_field.set(unique_value(title)) if title
    interact_with_checkbox(@hotel_cloud.edit_section_pop_up.required_checkbox, required) if required
    interact_with_checkbox(@hotel_cloud.edit_section_pop_up.multiple_checkbox, multiple) if multiple
    @hotel_cloud.edit_section_pop_up.last_item_name_field.set(unique_value(item_name)) if item_name
    @hotel_cloud.edit_section_pop_up.last_item_price_field.set price if price
    interact_with_checkbox(@hotel_cloud.edit_section_pop_up.last_item_enable_quantity_checkbox, quantity) if quantity
    @hotel_cloud.edit_section_pop_up.close_button.click
  end
end

When (/^I fill \[Additional Items\] row using the following data:$/) do |table|

  table.hashes.each do |item|

    name = item[:name]
    price = item[:price]

    @hotel_cloud.add_service_item_page.last_additional_item_name_field.set(unique_value(name)) if name
    @hotel_cloud.add_service_item_page.last_additional_item_price_field.set price if price
  end
end


When (/^I click \['(.*)'\] button in \[Edit Section\] pop up$/) do |button|
  case button
    when 'Close'
      @hotel_cloud.edit_section_pop_up.close_button.click
    when 'Add Feature'
      @hotel_cloud.edit_section_pop_up.add_feature_button.click
    when 'Delete Item'
      @hotel_cloud.edit_section_pop_up.last_delete_feature_button.click
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
end
