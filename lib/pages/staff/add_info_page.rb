class AddInfoPage < SitePrism::Page

  element :cover_title_field, '#info_item_translations_en_name'
  element :cover_hint_field, '#info_item_translations_en_hint'
  element :item_title_field, '#info_item_translations_en_long_name'
  element :item_description_field, '.text.optional.app-description'
  element :info_description, :xpath, '//*[@id="info_item_translations_en_description"]/../iframe'

  section :features_section, FeaturesSection, '.extra.active'
  section :actions, ActionsSection, '.modal-content'

  def type_info_description(description)
    page.execute_script("$('#info_item_translations_en_description').val('#{description}').change()");
  end

  def input_info_name(name)
    find(:xpath, "//input[@id='info_item_translations_#{name}_name']")
  end

  def input_info_hint(name)
    find(:xpath, "//*[@id='info_item_translations_#{name}_hint']")
  end

end

