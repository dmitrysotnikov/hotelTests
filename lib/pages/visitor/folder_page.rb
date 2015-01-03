class FolderPage < SitePrism::Page

  element :place_order_from_cart_button, '.mu-order-btn'
  element :disable_place_button, '.ladda-button'
  element :calendar_button, '.mu-time-btn'
  element :favorites_button, '.fa-star-o'
  element :close_folder, '.fa-times-circle'
  element :delete_favorites_button, '.favorited-content-item'
  element :button_list_view, :xpath, ".//button[@class='btn']"
  element :place_order_from_cart_button_value, '.mu-order-btn>span'
  element :shopping_cart_icon, '.fa.fa-shopping-cart'
  element :shopping_cart_title, '.span3.mu-cart.mu-title.hidden-phone>h3'
  element :delivery_charge, '.mu-delivery-charge'
  element :total_order_price, '.app-total'
  element :back_button, '.mu-backbutton.btn'



  def total_order_price_value
    total_order_price['textContent']
  end

  def delivery_charge_value
    delivery_charge['textContent']
  end

  def cart_folder_title
    shopping_cart_title['textContent']
  end


  def select_item(name)
    page.find('h3', text: name).click
  end

  def click_favorites_button
    page.execute_script("$('.fa-star-o').click()")
  end

  def list_view_button_name
    button_list_view['textContent']
  end


end