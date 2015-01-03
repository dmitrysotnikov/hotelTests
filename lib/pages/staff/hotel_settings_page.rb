class HotelSettingsPage < SitePrism::Page

  element :home_folder_name_field, '#establishment_root_folder_attributes_translations_en_name'
  element :disabled_chat_checkbox, '#establishment_disable_chat'
  element :default_currency_dropdown, '#establishment_default_currency'
  element :delivery_charge_field, '#establishment_delivery_charge'
  element :tax_rate_field, '#establishment_tax_rate'
  element :tax_included_checkbox, '#establishment_tax_included'
  element :butler_enabled_checkbox, '#establishment_butler_enabled'
  element :require_visitor_login_checkbox, '#establishment_require_visitor_login'
  element :directory_only_checkbox, '#establishment_directory_only'
  element :default_check_in_time_field, '#establishment_default_check_in_time'
  element :default_check_out_time_field, '#establishment_default_check_out_time'
  element :ampm_checkbox, '#establishment_ampm'
  element :auto_registration_cidr, '#establishment_auto_registration_cidr'
  element :save_button, '.btn'
  element :apple_touch_img, "#apple_touch_icon_direct_upload"
  element :apple_touch_icon, :xpath, "//label[text()='Smartphone Icon']/..//input[@type='file']"
  element :apple_touch_startup_image, :xpath, "//label[text()='Login Screen Image']/following::input[@type='file']"
  element :copy_from_hotel_dropdown, '#establishment_copy_from_establishment_id'
  element :start_copy_hotel_button, '[value="Start copying"]'
  element :pre_email_id_field, '#establishment_wufoo'

  section :header, HeaderSection, '.header'

  def upload_apple_touch_icon(image)
    find(:css, '#height-keeper .content>div:nth-of-type(1)>div')
    page.execute_script("$('#height-keeper .content>div:nth-of-type(1)>div').css('overflow','visible')");
    apple_touch_icon.set "#{File.dirname(__FILE__)}/../../../test_files/#{image}"
    sleep 2
  end

  def upload_apple_touch_startup_image(image)
    find(:css, '#height-keeper .content>div:nth-of-type(2)>div')
    page.execute_script("$('#height-keeper .content>div:nth-of-type(2)>div').css('overflow','visible')");
    apple_touch_startup_image.set "#{File.dirname(__FILE__)}/../../../test_files/#{image}"
    sleep 2
  end

  def apple_touch_icon_name
    apple_touch_img['src']
  end

  def language_checkbox(name)
    find(:xpath, "//label[contains(.,'#{name}')]/input")
  end

  def folder_checkbox(name)
    find(:xpath, "//span[text()='#{name}']/../input")
  end

end

