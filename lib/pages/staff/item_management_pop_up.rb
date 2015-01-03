class ItemManagementPopUp < SitePrism::Page

  element :action_drop_down, '#app-item-mgmt-form-select'
  element :move_to_drop_down, '#move_item_form #to'
  element :copy_to_drop_down, '#copy_item_form #to'
  element :import_to_drop_down, '#import_item_form #to'
  element :reference_to_drop_down, '#ref_item_form #to'
  element :move_button, '[value="Move!"]'
  element :import_button, '[value="Import!"]'
  element :copy_button, '[value="Copy!"]'
  element :reference_button, '[value="Reference!"]'
  element :close_button, '.close'

end