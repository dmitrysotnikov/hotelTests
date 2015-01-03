class WeatherPopUp < SitePrism::Page

  element :current_temp, '.row-fluid>h1>span'
  element :fahrenheit_button, '.fahrenheit.btn'
  element :celsius_button, '.celsius.btn'
  element :close_button, '.close.btn'

end