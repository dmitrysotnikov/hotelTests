$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'production').to_sym
raise "You need to create a configuration file named '#{ENVIRONMENT}.yml' under lib/config" unless File.exists? "#{File.dirname(__FILE__)}/../../lib/config/#{ENVIRONMENT}.yml"

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'faker'
require 'env_config'
require 'hotel_cloud'
require 'pages'
require 'common_helper'
require 'support/string'
require 'gmail'
require 'capybara/poltergeist'
require 'eyes_selenium'
require 'capybara_helper'
require 'active_support/inflector'
require 'hotel_cloud_api'

World(CommonHelper)
World(CapybaraHelper)

Capybara.configure do |config|
  driver = EnvConfig.get :driver

  case driver

    when 'selenium'
      config.default_driver = :selenium
      config.javascript_driver = :selenium
    when 'poltergeist'
      config.default_driver = :poltergeist
      config.javascript_driver = :poltergeist
    else
      raise ArgumentError.new "driver: #{driver} is not supported"
  end

  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = 30
  config.app_host = EnvConfig.get :url

  #capybara 2.1 config options
  config.match = :prefer_exact
  config.ignore_hidden_elements = false

end

case Capybara.default_driver
  when :selenium

  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new("./lib/ff_custom_profile")
    Capybara::Selenium::Driver.new(app, :profile => profile)
    profile["browser.cache.disk.enable"] = false
    profile["browser.cache.memory.enable"] = false
    profile.add_extension './features/support/extensions/JSErrorCollector.xpi'
    profile.add_extension './features/support/extensions/firebug-2.0.4-fx.xpi'
    profile.add_extension './features/support/extensions/firepath-0.9.7-fx.xpi'
    Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
  end
  when :poltergeist
  Capybara.register_driver :poltergeist do |app|
    options = {
        js_errors: false,
        timeout: 180,
        debug: true,
        # phantomjs_options: ['--load-images=no', '--disk-cache=false'],
        inspector: true,
        window_size: [1440, 900]
    }
    Capybara::Poltergeist::Driver.new(app, options)
  end
  else
    raise ArgumentError.new "driver: #{driver} is not supported"
end

SitePrism.configure do |config|
  config.use_implicit_waits = false
end

Before do |scenario|

  # @scenario_title = scenario.title

  #Connect to applitools server
  # Applitools::Eyes.api_key = EnvConfig.get :applitools_api_key
  # @eyes = Applitools::Eyes.new

  # page.driver.browser.manage.delete_all_cookies
  page.driver.browser.manage.window.maximize unless Capybara.javascript_driver == :poltergeist
  @random_string = Faker::Lorem.characters(4)
end

After do |scenario|

  #if page.driver.to_s.match("Selenium")
  #  errors = page.execute_script("return window.JSErrorCollector_errors.pump()")
  #
  #  if errors.any?
  #    puts '-------------------------------------------------------------'
  #    puts "Found #{errors.length} javascript #{ActiveSupport::Inflector.pluralize('error')}"
  #    puts '-------------------------------------------------------------'
  #    errors.each do |error|
  #      puts "    #{error["errorMessage"]} (#{error["sourceName"]}:#{error["lineNumber"]})"
  #    end
  #    raise "Javascript #{errors.length} #{ActiveSupport::Inflector.pluralize('error')} detected, see above"
  #  end
  #end

  if scenario.failed?
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    page.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  # page.driver.browser.manage.delete_all_cookies
end

# at_exit { @browser.quit }