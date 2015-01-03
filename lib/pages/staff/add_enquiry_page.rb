class AddEnquiryPage < SitePrism::Page

  element :enquiry_title_field, '#enquiry_item_translations_en_name'

  section :actions, ActionsSection, '.modal-content'

  def type_enquiry_description(description)
    page.execute_script("$('#enquiry_item_translations_en_description').val('#{description}').change()");
  end


  def input_enquiry_name(name)
    find(:xpath, ".//*[@id='enquiry_item_translations_#{name}_name']")
  end

end