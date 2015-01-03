class AddSectionPopUp < SitePrism::Page

  element :name_field, '#content_item_section_translations_en_name'
  element :save_button, '.submit'
  element :cancel_button, '.btn[data-dismiss="modal"]'
end