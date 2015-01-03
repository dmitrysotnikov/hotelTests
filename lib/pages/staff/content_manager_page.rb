class ContentManagerPage < SitePrism::Page

  set_url "/staff/content"

  element :preview_button, '.preview'
  element :edit_button, '.options .edit'
  element :add_folder_button, :xpath, '//a[text()="Folder"]'
  element :add_info_button, :xpath, '//a[text()="Info"]'
  element :add_link_button, :xpath, '//a[text()="Link"]'
  element :add_service_button, :xpath, '//a[text()="Service"]'
  element :add_enquiry_button, :xpath, '//a[text()="Enquiry"]'
  element :add_item_button, :xpath, '//*[text()="Add item"]'
  element :homepage_picture_button, :xpath, '//*[text()="Homepage Picture"]'
  element :preview_button, '.preview'
  element :overlay, '.jqmOverlay2'
  element :import_button, '.app-import'
  element :request_section, '#app-new-requests'
  element :add_button, '.dropdown-toggle'
  element :trash_button, '.app-trash'

  section :item, '.content_reference' do
    element :edit_button, '.edit.jqModal'
  end
  section :header, HeaderSection, '#navbar-collapse-1'

 def item_on_content_page(name)
   find(:xpath, ".//div[@class='main-actions']/a[text()='#{name}']").click
 end

  def preview_button_links
    find('a.pull-right')['href']
  end

  def guest_view_button_links
    find('[href="/"]')['href']
  end

  def item(name)
    find(:xpath, "//strong[text()='#{name}']/ancestor::div[@class='content_reference']")
  end

  def landing_item(name)
    find(:xpath, "//div[text()='#{name}']/ancestor::div[@class='content_reference']")
  end

  def delete_item_button(name)
    find(:xpath, "//*[contains(.,'#{name}')]/ancestor::div[@class='content_reference']//*[contains(@class,'delete')]")
  end

  def click_delete_landing_item(name)
    find(:xpath, "//div[text()='#{name}']/ancestor::div[@class='content_reference']//a[@class='delete']").click
  end

  def click_edit_landing_item(name)
    find(:xpath, "//div[text()='#{name}']/ancestor::div[@class='content_reference']//a[@class='edit jqModal']").click
  end

  def item_locator(name)
    "//strong[text()='#{name}']/ancestor::div[@class='content_reference']"
  end

  def hint_item_locator(item, hint)
    "//strong[text()='#{item}']/ancestor::div[@class='text']/div[text()='#{hint}']"
  end

  def landing_item_locator(name)
    "//div[text()='#{name}']/ancestor::div[@class='content_reference']"
  end

  def item_guest(name)
    find(:xpath, "//a[@class='thumbnail']//*[text()='#{name}']/ancestor::li")
  end

  def item_name(name)
    find(:xpath, "//strong[text()='#{name}']").click
  end

  def items_quantity
    all(:css, '.app-items li')
  end

  def items(name)
    all(:xpath, "//div[@class='text']//*[text()='#{name}']/ancestor::li")
  end

  def item_image(name)
    item(name).find(:css, 'img')['src']
  end

  def landing_item_image(name)
    landing_item(name).find(:css, 'img')['src']
  end

  def click_edit_item(name)
    item(name).find(:css, '.edit').click
  end

  def click_move_item(name)
    item(name).find(:css, '.move').click
  end

  def click_delete_item(name)
    delete_item_button(name).click
  end

  def drag_and_drop_item(name, target)
    move_icon = item(name).find(:css, '.move')
    page.driver.browser.mouse.down(move_icon.native)
    page.driver.browser.mouse.move_to(item(target).native, 300, 0)
    page.driver.browser.mouse.up
    return name, target
  end

  def drag_first_and_drop_to_second(item, item2)
    drag_and_drop_item(item, item2)
  end

  def first_item
    find(:xpath, '//li[1]//strong').text
  end

  def first_after_second?(second)
    first = first_item
    first.eql? second
  end


end