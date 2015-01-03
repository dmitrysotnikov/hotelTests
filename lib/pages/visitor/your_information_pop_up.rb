class YourInformationPopUp < SitePrism::Page

  element :stay_room_field, '#stay_room'
  element :dont_have_room_radiobutton, "[value='0']"
  element :guest_radiobutton, "[value='1']"
  element :register_my_stay_button, '.form-actions .btn-primary'
  element :cancel_button, ".close"

  def register_my_stay_button_xpath
    '//*[@class="mu-new-stay"]//*[@class="btn btn-primary"]'
  end

  def set_check_in_date date
    page.execute_script("$('input#stay_check_in_at.visible-phone.visible-ipad').val(\'#{date}'\).change()")
  end

  def set_check_out_date date
    page.execute_script("$('input#stay_check_out_at.visible-phone.visible-ipad').val(\'#{date}'\).change()")
  end
end
