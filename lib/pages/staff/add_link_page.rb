class AddLinkPage < SitePrism::Page

  element :link_title_field, '#link_item_translations_en_name'
  element :link_hint_field, '#link_item_translations_en_hint'
  element :link_description, :xpath, '//*[@id="link_item_translations_en_description"]/../iframe'
  element :link_url_field, '#link_item_url'
  element :embed_website_checkbox, '#link_item_open_in_iframe'
  element :skip_popup_checkbox, '#link_item_click_through'
  element :item_title_field, '#link_item_translations_en_long_name'

  section :features_section, FeaturesSection, '.extra.active'
  section :actions, ActionsSection, '.modal-content'

  def type_link_description(description)
    page.execute_script("$('#link_item_translations_en_description').val('#{description}').change()");
  end

  def input_link_name(name)
    find(:xpath, "//input[@id='link_item_translations_#{name}_name']")
  end

  def input_link_hint(name)
    find(:xpath, "//*[@id='link_item_translations_#{name}_hint']")
  end

end