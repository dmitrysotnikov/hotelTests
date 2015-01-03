class VisitorHomePage < SitePrism::Page

  set_url '/'

  element :language_button, '.app-account-language'
  element :save_language, '.app-submit'
  element :cancel_language, '.btn.pull-left'
  element :cancel_button, '#close-account-settings'
  element :current_language, '.mu-current-language>h4'
  element :items, '.span3'
  element :choose_room_link, '[href="#stays/new"]'
  element :email_field, '#visitor_email'
  element :email_error, '.help-inline.visitor-errors'
  element :receive_email_button, '.iphone-style'
  element :weather_popup, '.mu-weather-modal'
  element :search_field, '.search-query'
  element :clear_search_button, '.fa-times.hide'
  element :favorites_folder_button, :xpath, ".//a[@href='#favorites']"
  element :input_favorites_code_field, "#favorites_code"
  element :current_favorites_code_field, :xpath, ".//label[text()='Share your favorites with this code:']//..//input"
  element :current_favorites_url_field, :xpath, ".//label[text()='URL:']//..//input"
  element :load_favorites_button, '.js-load-favorites'
  element :confirm_favorites_import_button, :xpath, ".//button[text()='Confirm Import!']"
  element :results_title, 'h2.mu-search-heading'
  element :import_error, '.visitor-errors'
  element :remove_favorites, '.js-clear-fav'
  element :butler_button, '.mu-butler'
  element :confirm_my_butler_button, '.mu-launch-link'
  element :accept_bundler_popup, '.main-header>multiline'
  section :header, VisitorHeaderSection, '.dashboard-part'

  def accept_butler_popup_text
    accept_bundler_popup['textContent']
  end

  def logout_button_xpath
    ".//i[@class='fa fa-sign-out mu-signout']"
  end

  def login_button_xpath
    ".//i[@class='fa fa-sign-in mu-signin']"
  end

  def butler_button_xpath
    ".//button[@class='app-nav-butler btn pull-right mu-btn1 mu-butler']"
  end

  def select_item(name)
    page.find('h3', text: name).click
  end

  def choose_language(name)
    find(".small.flag.#{name}").click
  end

  def email_field_value
    email_field['value']
  end

  def favorites_code_field_value
    current_favorites_code_field['value']
  end

  def favorites_url_field_value
    current_favorites_url_field['value']
  end

  def click_language_button
    page.execute_script("$('.flag').click();")
  end

  def item_locator(name)
    "//h3[text()='#{name}']"
  end

  def item_href(name)
    find(:xpath, "//h3[text()='#{name}']/..")['href']
  end

  def list_item_locator(name)
    "//*[contains(@class,'list-view')]//div[text()='#{name}']"
  end

  def hint_item_locator(name, hint)
    "//h3[text()='#{name}']/../p[text()='#{hint}']"
  end

  def breadcrumb
    '.mu-folder-name'
  end

end