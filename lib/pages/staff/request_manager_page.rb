class RequestManagerPage < SitePrism::Page

  element :show_all_checkbox, '#include_all'
  section :header, HeaderSection, '.header'
  element :new_first_request, :xpath, ".//*[@class='new-requests']//tbody//tr[1]"
  element :current_first_request, :xpath, ".//*[@class='current-requests']//tbody//tr[1]"
  element :past_first_request, :xpath, ".//*[@class='past-requests']//tbody//tr[1]"


  def room_guest(status, request, name)
    find(:xpath, ".//span[text()='#{status}']//..//..//span[text()='#{request}']//..//..//span[text()='#{name}']").click
  end

  def room_guest_present(status, request, name)
    find(:xpath, ".//span[text()='#{status}']//..//..//span[text()='#{request}']//..//..//span[text()='#{name}']")
  end

end