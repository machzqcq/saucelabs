require 'saucelabs/sauce_browser_factory'
require 'saucelabs/parsed_values'

module SauceLabs
  #attr_accessor :factory

  #
  # Creates a watir browser session and returns the browser object
  #
  # @example
  # SauceLabs.watir_browser(browser = :chrome, browser_options = {})
  # @param  [String] the browser string passed into the method
  # @param [Hash] the optional hash to specify browser options
  # @return [Object] browser session
  #

  def self.watir_browser(browser = :firefox, browser_options={})
    factory.watir_browser(browser,browser_options)
  end

  #
  # Creates a Selenium driver session and returns the driver object
  #
  # @example
  # SauceLabs.selenium_driver(browser = :chrome, browser_options = {})
  # @param  [String] the browser string passed into the method
  # @param [Hash] the optional hash to specify browser options
  # @return [Object] browser session
  #

  def self.selenium_driver(browser = :firefox, browser_options={})
    factory.selenium_driver(browser,browser_options)
  end

  #
  # Yields to Factory object if parameters are set using conf
  #
  # @return [Object] browser session
  #

  def self.conf
    yield factory
  end

  private

  def self.factory
    @factory ||= SauceBrowserFactory.new
  end

  

end