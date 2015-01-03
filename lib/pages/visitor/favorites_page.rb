class FavoritesPage < SitePrism::Page

  set_url '/#favorites'

  element :favorites_folder_title, :xpath, "//*[text()='My Favorites']"

  def item_locator(name)
    "//h3[text()='#{name}']"
  end

end