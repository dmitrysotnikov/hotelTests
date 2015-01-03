class ActionsSection < SitePrism::Section

  element :ok_button, '.submit'
  element :select_language, '#language-select'
  element :cancel_button, '.modal-footer>.btn-default'
  element :close_button, '.close'
  element :features, '[data-target=".extra"]'
  element :main, '[data-target=".main"]'

end