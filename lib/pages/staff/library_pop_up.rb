class LibraryPopUp < SitePrism::Page

  element :close_button, '#dialog2 .close'
  element :first_image, '#images div:first-child .library-image>img'
  element :cancel_button, '#dialog2 .cancel'
end