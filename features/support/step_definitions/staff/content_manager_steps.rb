languages = {'Turkish' => 'tr', 'Spanish' => 'es', 'Arabic' => 'ar', 'Chinese' => 'zh-CN', 'French' => 'fr', 'German' => 'de',
             'Hebrew' => 'he', 'Italian' => 'it', 'Portuguese' => 'pt', 'Russian' => 'ru'  }

When (/^I open \[Content Manager\] page$/) do
  @hotel_cloud.content_manager_page.header.content_manager_tab.click
end


When (/^I click \['(.*)'\] button at content page$/) do |button|
  case button
    when 'Add Folder'
      @hotel_cloud.content_manager_page.add_button.click
      @hotel_cloud.content_manager_page.add_folder_button.click
    when 'Add Info'
      @hotel_cloud.content_manager_page.add_button.click
      @hotel_cloud.content_manager_page.add_info_button.click
    when 'Add Link'
      @hotel_cloud.content_manager_page.add_button.click
      @hotel_cloud.content_manager_page.add_link_button.click
    when 'Add Service'
      @hotel_cloud.content_manager_page.add_button.click
      @hotel_cloud.content_manager_page.add_service_button.click
    when 'Add Enquiry'
      @hotel_cloud.content_manager_page.add_button.click
      @hotel_cloud.content_manager_page.add_enquiry_button.click
    when 'Import'
      @hotel_cloud.content_manager_page.import_button.click
    when 'Add Item'
      @hotel_cloud.content_manager_page.add_item_button.click
    when 'Homepage Picture'
      @hotel_cloud.content_manager_page.homepage_picture_button.click
    when 'Preview'
      item = @hotel_cloud.content_manager_page.preview_button_links
      visit(item)
      @hotel_cloud.visitor_home_page.wait_until_search_field_visible
    when 'Trash'
      @hotel_cloud.content_manager_page.trash_button.click
    when 'testalex'
      @hotel_cloud.content_manager_page.item_on_content_page(button)
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
end


When (/^I click \['(.*)'\] button in \[Add Item\] pop up$/) do |button|
  case button
    when 'Main'
      @hotel_cloud.add_service_item_page.actions.main.click
    when 'Cancel'
      @hotel_cloud.add_service_item_page.actions.cancel_button.click
    when 'Features'
      @hotel_cloud.add_service_item_page.actions.features.click
    when 'Save'
      @hotel_cloud.add_folder_page.actions.ok_button.click
      sleep 2
    else
      raise ArgumentError.new "button: #{button} is not supported"
  end
end


When (/^I create new services? using the following data:$/) do |table|

  table.hashes.each do |service|

    title = service[:title]
    hint = service[:hint]
    image = service[:image]
    price = service[:price]
    enable_quantity = service[:enable_quantity]
    description = service[:description]
    language =  service[:language]
    title_lang = service[:title_lang]
    hint_lang = service[:hint_lang]
    template = service[:template]
    price_policy = service[:price_policy]
    item_title = service[:item_title]

    step "I click ['Add Service'] button at content page"

    # fill 'Main' tab
    @hotel_cloud.add_service_item_page.title_field.set unique_value title if title
    @hotel_cloud.add_service_item_page.hint_field.set unique_value hint if hint
    @hotel_cloud.add_folder_page.actions.select_language select language if language
    @hotel_cloud.add_service_item_page.input_service_name(languages[language]).set unique_value title_lang if title_lang
    @hotel_cloud.add_service_item_page.input_service_hint(languages[language]).set unique_value hint_lang if hint_lang
    @hotel_cloud.add_service_item_page.type_item_title item_title if item_title
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_service_item_page.select_template.select template if template
    @hotel_cloud.add_service_item_page.select_policy.select price_policy if price_policy
    @hotel_cloud.add_service_item_page.item_price_field.set price if price
    interact_with_checkbox(@hotel_cloud.add_service_item_page.enable_quantity_checkbox, enable_quantity) if enable_quantity
    @hotel_cloud.add_service_item_page.type_description description if description

    @hotel_cloud.add_service_item_page.actions.ok_button.click
    sleep 2
  end
end


When(/^I create new folder using the following data:$/) do |table|
  @hotel_cloud = HotelCloud.new

  table.hashes.each do |folder|
    title = folder[:title]
    hint = folder[:hint]
    phone = folder[:phone]
    image = folder[:image]
    language = folder[:language]
    title_lang = folder[:title_lang]
    hint_lang = folder[:hint_lang]
    list_view = folder[:list_view]
    add_tax = folder[:add_tax]
    add_delivery = folder[:add_delivery]
    shopping_cart = folder[:shopping_cart]

    step "I click ['Add Folder'] button at content page"

    #fill form
    @hotel_cloud.add_folder_page.folder_title_field.set unique_value(title) if title
    @hotel_cloud.add_folder_page.folder_hint_field.set unique_value(hint) if hint
    @hotel_cloud.add_folder_page.actions.select_language select language if language
    @hotel_cloud.add_folder_page.input_folder_name(languages[language]).set unique_value(title_lang) if title_lang
    @hotel_cloud.add_folder_page.input_folder_hint(languages[language]).set unique_value(hint_lang) if hint_lang
    @hotel_cloud.add_folder_page.folder_phone_field.set unique_value(phone) if phone
    @hotel_cloud.upload_image_page.upload_image image if image
    interact_with_checkbox(@hotel_cloud.add_folder_page.enable_shopping_cart, shopping_cart) if shopping_cart
    interact_with_checkbox(@hotel_cloud.add_folder_page.list_view_checkbox, list_view) if list_view
    interact_with_checkbox(@hotel_cloud.add_folder_page.add_tax_checkbox, add_tax) if add_tax
    interact_with_checkbox(@hotel_cloud.add_folder_page.add_delivery_checkbox, add_delivery) if add_delivery
    @hotel_cloud.add_folder_page.actions.ok_button.click
    sleep 2
  end
end


When(/^I create new info using the following data:$/) do |table|
  @hotel_cloud = HotelCloud.new

  table.hashes.each do |info|
    title = info[:title]
    hint = info[:hint]
    image = info[:image]
    description = info[:description]
    language = info[:language]
    title_lang = info[:title_lang]
    hint_lang = info[:hint_lang]
    info_title = info[:info_title]
    features = info[:features]

    step "I click ['Add Info'] button at content page"

    #fill 'Main' tab
    @hotel_cloud.add_info_page.cover_title_field.set unique_value title if title
    @hotel_cloud.add_info_page.cover_hint_field.set unique_value hint if hint
    @hotel_cloud.add_folder_page.actions.select_language select language if language

    @hotel_cloud.add_info_page.input_info_name(languages[language]).set unique_value title_lang if title_lang
    @hotel_cloud.add_info_page.input_info_hint(languages[language]).set unique_value hint_lang if hint_lang
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_info_page.item_title_field.set info_title if info_title
    @hotel_cloud.add_info_page.type_info_description description if description

    #fill 'Features' tab
    if features
      @hotel_cloud.add_info_page.actions.features.click
      @hotel_cloud.add_info_page.features_section.wait_until_info_features_field_visible
      @hotel_cloud.add_info_page.features_section.info_features_field.set features if features
    end

    @hotel_cloud.add_info_page.actions.ok_button.click
    sleep 2
  end

end


When(/^I create new link using the following data:$/) do |table|

  table.hashes.each do |link|
    title = link[:title]
    hint = link[:hint]
    image = link[:image]
    description = link[:description]
    url = link[:url]
    embed_website = link[:embed_website]
    skip_popup = link[:skip_popup]
    language = link[:language]
    title_lang = link[:title_lang]
    hint_lang = link[:hint_lang]
    link_title = link[:link_title]
    features = link[:features]

    step "I click ['Add Link'] button at content page"

    @hotel_cloud.add_link_page.link_title_field.set unique_value title if title
    @hotel_cloud.add_link_page.link_hint_field.set unique_value hint if hint
    @hotel_cloud.add_folder_page.actions.select_language select language if language

    @hotel_cloud.add_link_page.input_link_name(languages[language]).set unique_value title_lang if title_lang
    @hotel_cloud.add_link_page.input_link_hint(languages[language]).set unique_value hint_lang if hint_lang
    @hotel_cloud.upload_image_page.upload_image image if image

    @hotel_cloud.add_link_page.item_title_field.set link_title if link_title
    @hotel_cloud.add_link_page.type_link_description description if description
    @hotel_cloud.add_link_page.link_url_field.set url if url
    @hotel_cloud.add_link_page.embed_website_checkbox.set(embed_website.to_bool) if embed_website
    interact_with_checkbox(@hotel_cloud.add_link_page.skip_popup_checkbox, skip_popup) if skip_popup

    #fill 'Features' tab
    if features
      @hotel_cloud.add_link_page.actions.features.click
      @hotel_cloud.add_link_page.features_section.wait_until_link_features_field_visible
      @hotel_cloud.add_link_page.features_section.link_features_field.set features if features
    end

    @hotel_cloud.add_link_page.actions.ok_button.click
    sleep 2
  end
end


When(/^I create new enquiry using the following data:$/) do |table|
  @hotel_cloud = HotelCloud.new

  table.hashes.each do |enquiry|
    title = enquiry[:title]
    image = enquiry[:image]
    description = enquiry[:description]
    language = enquiry[:language]
    title_lang = enquiry[:title_lang]


    step "I click ['Add Enquiry'] button at content page"

    #fill 1 step form
    @hotel_cloud.add_enquiry_page.enquiry_title_field.set unique_value title if title
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_folder_page.actions.select_language select language if language

    @hotel_cloud.add_enquiry_page.input_enquiry_name(languages[language]).set unique_value title_lang if title_lang

    #fill 2 step form
    @hotel_cloud.add_enquiry_page.type_enquiry_description description if description
    @hotel_cloud.add_enquiry_page.actions.ok_button.click
    sleep 2
  end

end


When(/^I create new item on landing page with '(.*)' link and '(.*)' image$/) do |link, image|

  step "I click ['Add Item'] button at content page"
  @hotel_cloud.add_landing_item_page.landing_url_field.set unique_value link if link
  @hotel_cloud.upload_image_page.upload_image image if image
  @hotel_cloud.add_landing_item_page.save_button.click
end


When(/^I delete item on landing page with '(.*)' link$/) do |link|
  step "I press 'Delete' button for '#{link}' landing item"
  step "I 'confirm' deletion"
end


When(/^I press 'Edit' button for '(.*)' landing item$/) do |name|
  @hotel_cloud.content_manager_page.click_edit_landing_item unique_value(name)
end


When(/^I edit landing item using the following data:$/) do |table|
  table.hashes.each do |item|
    link = item[:link]
    image = item[:image]

    @hotel_cloud.add_landing_item_page.landing_url_field.set unique_value link if link
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_landing_item_page.save_button.click
  end
end


When(/^I press 'Delete' button for '(.*)' landing item$/) do |name|
  @hotel_cloud.content_manager_page.click_delete_landing_item unique_value(name)
end


When(/^I press 'Edit' button for '(.*)' item$/) do |name|
  @hotel_cloud.content_manager_page.click_edit_item unique_value(name)
end


When(/^I click delete for '(.*)' test item$/) do |name|
  sleep 2
  @i = 0
  @num = 5
  begin
    @hotel_cloud.content_manager_page.click_delete_item name
    page.driver.browser.switch_to.alert.accept
    sleep 1
  end until @i > @num
end


When(/^I press 'Delete' button for '(.*)' item$/) do |name|
  @hotel_cloud.content_manager_page.click_delete_item unique_value(name)
end


When(/^I delete '(.*)' item$/) do |name|
  step "I press 'Delete' button for '#{name}' item"
  step "I 'confirm' deletion"
end


When(/^I edit folder using the following data:$/) do |table|
  table.hashes.each do |folder|
    title = folder[:title]
    hint = folder[:hint]
    phone = folder[:phone]
    image = folder[:image]

    #fill form
    @hotel_cloud.add_folder_page.folder_title_field.set unique_value title if title
    @hotel_cloud.add_folder_page.folder_hint_field.set unique_value hint if hint
    @hotel_cloud.add_folder_page.folder_phone_field.set unique_value phone if phone
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_folder_page.enable_shopping_cart.click
    @hotel_cloud.add_folder_page.actions.ok_button.click
    sleep 2
  end
end


When /^I edit services? using the following data:$/ do |table|

  table.hashes.each do |service|

    title = service[:title]
    hint = service[:hint]
    image = service[:image]
    price = service[:price]
    enable_quantity = service[:enable_quantity]
    description = service[:description]

    @hotel_cloud.add_service_item_page.title_field.set unique_value title if title
    @hotel_cloud.add_service_item_page.hint_field.set unique_value hint if hint
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_service_item_page.item_price_field.set price if price
    @hotel_cloud.add_service_item_page.enable_quantity_checkbox.set(enable_quantity.to_bool) if enable_quantity
    @hotel_cloud.add_service_item_page.type_description description if description
    @hotel_cloud.add_service_item_page.actions.ok_button.click
    sleep 2
  end
end


When(/^I edit enquiry using the following data:$/) do |table|

  table.hashes.each do |enquiry|
    title = enquiry[:title]
    hint = enquiry[:hint]
    image = enquiry[:image]
    description = enquiry[:description]

    @hotel_cloud.add_enquiry_page.enquiry_title_field.set unique_value title if title
    @hotel_cloud.add_enquiry_page.enquiry_hint_field.set unique_value hint if hint
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_enquiry_page.type_enquiry_description description if description
    @hotel_cloud.add_enquiry_page.actions.ok_button.click
    sleep 2
  end

end


When(/^I edit info using the following data:$/) do |table|

  table.hashes.each do |info|
    title = info[:title]
    hint = info[:hint]
    image = info[:image]
    description = info[:description]

    @hotel_cloud.add_info_page.cover_title_field.set unique_value title if title
    @hotel_cloud.add_info_page.cover_hint_field.set unique_value hint if hint
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_info_page.type_info_description description if description
    @hotel_cloud.add_info_page.actions.ok_button.click
    sleep 2
  end

end


When(/^I edit link using the following data:$/) do |table|
  table.hashes.each do |link|
    title = link[:title]
    hint = link[:hint]
    image = link[:image]
    description = link[:description]
    url = link[:url]
    embed_website = link[:embed_website]
    skip_popup = link[:skip_popup]

    @hotel_cloud.add_link_page.link_title_field.set unique_value title if title
    @hotel_cloud.add_link_page.link_hint_field.set unique_value hint if hint
    @hotel_cloud.upload_image_page.upload_image image if image
    @hotel_cloud.add_link_page.type_link_description description if description
    @hotel_cloud.add_link_page.link_url_field.set url if url
    @hotel_cloud.add_link_page.embed_website_checkbox.set(embed_website.to_bool) if embed_website
    @hotel_cloud.add_link_page.skip_popup_checkbox.set(skip_popup.to_bool) if skip_popup
    @hotel_cloud.add_link_page.actions.ok_button.click
    sleep 2
  end
end


When(/^I '(.*)' '(.*)' to '(.*)'$/) do |action, name, to|
  @hotel_cloud.content_manager_page.click_move_item unique_value(name)
  @hotel_cloud.item_management_pop_up.action_drop_down.select action
  to = unique_value(to)
  case action
    when 'Copy'
      @hotel_cloud.item_management_pop_up.copy_to_drop_down.select to
      @hotel_cloud.item_management_pop_up.copy_button.click
    when 'Import'
      @hotel_cloud.item_management_pop_up.import_to_drop_down.select to
      @hotel_cloud.item_management_pop_up.import_button.click
    when 'Move'
      @hotel_cloud.item_management_pop_up.move_to_drop_down.select to
      @hotel_cloud.item_management_pop_up.move_button.click
    when 'Reference'
      @hotel_cloud.item_management_pop_up.reference_to_drop_down.select to
      @hotel_cloud.item_management_pop_up.reference_button.click
    else
      raise ArgumentError.new "action: #{action} is not supported"
  end
  @hotel_cloud.item_management_pop_up.wait_until_action_drop_down_invisible
end


When(/^I drag-and-drop '(.*)' item to '(.*)' item$/) do |item, item2|
  @hotel_cloud.content_manager_page.drag_first_and_drop_to_second(item, item2)
end


When(/^I press on '(.*)' item from list$/) do |category|
  @hotel_cloud.content_manager_page.item_name unique_value(category)
  sleep 1
end


When /^I press 'Preview' button at content page with enabled Require visitor login options$/ do
  item = @hotel_cloud.content_manager_page.preview_button_links
  visit(item)
end


Then(/^I should see (\d+) '(.*)' items on content management page$/) do |quantity, name|
  sleep 1
  @hotel_cloud.content_manager_page.items(unique_value(name)).count.should eql(quantity.to_i)
end


Then /^I should( not)? see '(.*)' item on content management page$/ do |negate, name|
  item = @hotel_cloud.content_manager_page.item_locator unique_value(name)
  visible = element_visible?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end


Then /^I should( not)? see '(.*)' item with '(.*)' cover hint on content management page$/ do |negate, name, hint|
  item = @hotel_cloud.content_manager_page.hint_item_locator(unique_value(name), unique_value(hint))
  visible = element_visible?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end


Then /^I should( not)? see '(.*)' landing item on content management page$/ do |negate, name|
  item = @hotel_cloud.content_manager_page.landing_item_locator unique_value(name)
  visible = element_visible?(item)
  negate ? visible.should(be_falsey) : visible.should(be_truthy)
end


Then /^'(.*?)' image for '(.*?)' item should( not)? be visible on content management page$/ do |item, name, negate|
  case item
    when 'default folder'
      default_image = EnvConfig.get(:default_folder_image)
    when 'default service'
      default_image = EnvConfig.get(:default_service_image)
    when 'default info'
      default_image = EnvConfig.get(:default_info_image)
    when 'default link'
      default_image = EnvConfig.get(:default_link_image)
    else
      raise ArgumentError.new "item: #{item} is not supported"
  end
  item_image = @hotel_cloud.content_manager_page.item_image unique_value(name)
  negate ? item_image.should_not(have_content(default_image)) : item_image.should(have_content(default_image))
end


Then /^'(.*?)' image for '(.*?)' landing item should( not)? be visible on content management page$/ do |item, name, negate|
  case item
    when 'default link'
      default_image = EnvConfig.get(:default_link_image)
    else
      raise ArgumentError.new "item: #{item} is not supported"
  end
  item_image = @hotel_cloud.content_manager_page.landing_item_image unique_value(name)
  negate ? item_image.should_not(have_content(default_image)) : item_image.should(have_content(default_image))
end


Then(/^I should stay on the popup for  '(.*)' creation$/) do |item|
  case item
    when 'enquiry'
      @hotel_cloud.add_enquiry_page.enquiry_title_field.should(be_visible)
    when 'service'
      @hotel_cloud.add_service_item_page.title_field.should(be_visible)
    when 'link'
      @hotel_cloud.add_link_page.link_title_field.should(be_visible)
    when 'info'
      @hotel_cloud.add_info_page.cover_title_field.should(be_visible)
    when 'folder'
      @hotel_cloud.add_folder_page.folder_title_field.should(be_visible)
  end
end


Then /^I should( not)? see '(.*)' checkbox on folder page$/ do |negate, check|
  case check
    when 'Add Tax'
      item =  @hotel_cloud.add_folder_page.add_tax_label_xpath
      visible = element_visible?(item)
      negate ? visible.should(be_falsey) : visible.should(be_truthy)
    when 'Add delivery'
      interact_with_checkbox(@hotel_cloud.add_folder_page.enable_shopping_cart, 'checked')
      item =  @hotel_cloud.add_folder_page.add_delivery_label_xpath
      visible = element_visible?(item)
      negate ? visible.should(be_falsey) : visible.should(be_truthy)
  end
end


Then /^I should see '(.*)' tax for adding$/ do |perc|
  @hotel_cloud.add_folder_page.add_tax_xpath.should include perc
end


Then /^I should see '(.*)' delivery for adding$/ do |perc|
  interact_with_checkbox(@hotel_cloud.add_folder_page.enable_shopping_cart, 'checked')
  @hotel_cloud.add_folder_page.add_delivery_xpath.should include perc
end
