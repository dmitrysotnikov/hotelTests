class AddFolderPage < SitePrism::Page

  element :folder_title_field, '#folder_translations_en_name'
  element :folder_hint_field, '#folder_translations_en_hint'
  element :folder_phone_field, '#folder_phone'
  element :enable_shopping_cart, '#folder_allow_shopping_card'
  element :list_view_checkbox, '#folder_list_view'
  element :add_tax_checkbox, '#folder_add_tax'
  element :add_delivery_checkbox, '#folder_add_delivery_charge'
  element :tax_label, :xpath, ".//*[@id='folder_add_tax']/ancestor::label"
  element :delivery_label, :xpath, ".//*[@id='folder_add_delivery_charge']/ancestor::label"

  section :actions, ActionsSection, '.modal-content'

  def add_tax_xpath
    tax_label['textContent']
  end

  def add_delivery_xpath
    delivery_label['textContent']
  end

  def add_tax_label_xpath
    ".//label[input[@name='folder[add_tax]']]"
  end

  def add_delivery_label_xpath
  ".//label[input[@name='folder[add_delivery_charge]']]"
  end

  def input_folder_name(name)
    find(:xpath, "//input[@id='folder_translations_#{name}_name']")
  end

  def input_folder_hint(name)
    find(:xpath, "//*[@id='folder_translations_#{name}_hint']")
  end

end