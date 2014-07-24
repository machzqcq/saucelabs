require 'saucelabs/sauce_browser_factory'
require 'saucelabs/parsed_values'

module SauceLabs
  attr_accessor :factory

  def self.watir_browser(browser = :chrome, browser_options={})
    factory.watir_browser(browser,browser_options)
  end

  def self.selenium_browser(browser = :chrome, browser_options={})
    factory.selenium_browser(browser,browser_options)
  end

  def self.conf
    yield
  end

  private

  def self.factory
    @factory = SauceBrowserFactory.new unless factory
  end

  

end