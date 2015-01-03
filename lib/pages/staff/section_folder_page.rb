class SectionFolderPage < SitePrism::Page

  element :add_section_button, '.jqModal.btn-add'
  elements :section_names, '.sections h3'

  def section(name)
    find(:xpath, "//h3[contains (.,'#{name}')]/ancestor::div[@class='heading']")
  end

  def action(name)
    find(:xpath, "//a[text()='#{name}']").click
  end

  def action_present(name)
    find(:xpath, "//a[text()='#{name}']")
  end

  def drag_and_drop_section(section, target)

    element = section(section)
    move_icon = element.find(:xpath, ".//span[@title='Move']")

    page.driver.browser.mouse.down(move_icon.native)
    page.driver.browser.mouse.move_to(section(target).native, 50, 50)
    page.driver.browser.mouse.up
    sleep 2
  end

  def section_locator(name)
    "//h3[contains(.,'#{name}')]/ancestor::div[@class='section']"
  end

end