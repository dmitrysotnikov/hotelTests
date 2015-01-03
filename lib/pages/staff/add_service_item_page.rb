class AddServiceItemPage < SitePrism::Page

  element :title_field, '#service_item_translations_en_name'
  element :hint_field, '#service_item_translations_en_hint'
  element :item_title_field, '#service_item_translations_en_long_name'
  element :item_price_field, '#service_item_price'
  element :enable_quantity_checkbox, '#service_item_requires_amount'
  element :description_frame, '[data-locale="en"] iframe'
  element :add_section_button, '.feature_groups .add-item'
  element :select_policy, '#service_item_pricing_policy'
  element :select_template, '#service_item_template'
  element :add_section_button, '.feature_groups .add-item'
  element :last_section_edit_button, '.feature_groups li:last-child .js-edit'
  element :last_section_delete_button, '.feature_groups li:last-child .js-delete'
  element :last_additional_item_name_field, '.feature-items>li:last-child>[name="name"]'
  element :last_additional_item_price_field, '.feature-items>li:last-child>.input-mini'
  element :last_additional_item_delete_button, '.feature-items>li:last-child>.js-delete'
  element :add_feature_button, '.btn-group>.add-item'
  element :add_text_input_button, '.btn-group>.add-input'

  section :features_section, FeaturesSection, ".nav-tabs [data-target='.extra']"
  section :actions, ActionsSection, '.modal-content'

  def type_description(description)
    page.execute_script("$('#service_item_translations_en_description').val('#{description}').change()");
  end

  def section(name)
    find(:xpath, "//div[contains(@class, 'feature_groups')]//li[text()='#{name}']')")
  end

  def edit_section(name)
    section(name).find(:css, 'button')
  end

  def edit_button(section_name)
    find(:xpath, "//li[contains(text(), '#{section_name}')]//*[contains(@class, 'js-edit')]")
  end

  def delete_button(section_name)
    find(:xpath, "//li[contains(text(), '#{section_name}')]//*[contains(@class, 'js-delete')]")
  end

  def input_service_name(name)
    find(:xpath, "//input[@id='service_item_translations_#{name}_name']")
  end

  def input_service_hint(name)
    find(:xpath, "//*[@id='service_item_translations_#{name}_hint']")
  end

  def type_item_title(item_title)
    item_title_field.native.send_keys([:control, 'a'], :backspace)
    item_title_field.set(item_title)
  end

end