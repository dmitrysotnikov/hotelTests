class UploadImagePage < SitePrism::Page

  element :change_own_image_button, '.image-selection+.js-upload'
  element :upload_own_image_button, '.modal-body>div>form>input'
  element :done_upload_image_button, '.loading_indicator+.btn-primary'
  element :hide_done_upload_button, :xpath, ".//button[@class='btn btn-primary']//..//button[@aria-hidden='false']"


  def upload_image(image)
    change_own_image_button.click
    upload_own_image_button.set "#{File.dirname(__FILE__)}/../../../test_files/#{image}"
    sleep 5
    done_upload_image_button.click
    wait_until_done_upload_image_button_invisible
  end
end