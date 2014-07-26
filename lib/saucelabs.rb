require 'saucelabs/sauce_browser_factory'
require 'saucelabs/parsed_values'

module SauceLabs
  #attr_accessor :factory

  def self.watir_browser(browser = :firefox, browser_options={})
    factory.watir_browser(browser,browser_options)
  end

  def self.selenium_driver(browser = :firefox, browser_options={})
    factory.selenium_driver(browser,browser_options)
  end

  def self.conf
    yield factory
  end

  private

  def self.factory
    @factory ||= SauceBrowserFactory.new
  end

  

end