require_relative 'parsed_values'
require 'selenium-webdriver'
require 'watir-webdriver'

module SauceLabs
  #
  # This class has the code necessary to create an instance of browser after making a connection to saucelabs.
  # This class can also be used to create browser instance for local connections
  #
  class SauceBrowserFactory
    include ParsedValues

    attr_accessor :url,:options,:persistent_http

    #
    # Creates a watir browser session and returns the browser object
    #
    # @example
    # SauceLabs.watir_browser(browser = :chrome, browser_options = {})
    # @param  [String] the browser string passed into the method
    # @param [Hash] the optional hash to specify browser options
    # @return [Object] browser session
    #

    def watir_browser(browser,browser_options)
      target,options = browser_caps(browser,browser_options)
      create_watir_browser(target,options)
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

    def selenium_driver(browser,browser_options)
      target,options = browser_caps(browser,browser_options)
      create_selenium_driver(target,options)
    end
    
    
    def capybara_driver(browser,browser_options)
      Capybara.register_driver :selenium do |app|
          Capybara::Selenium::Driver.new(app, :browser => browser)
      end
      Capybara.default_driver = :selenium
      target,options = browser_caps(browser,browser_options)
      create_selenium_driver(target,options)
    end

    private

    def create_watir_browser(target,options)
      if options.empty?
        Watir::Browser.new target
      else
        Watir::Browser.new target,options
      end
    end

    def create_selenium_driver(target,options)
      if options.empty?
        Selenium::WebDriver.for target
      else
        Selenium::WebDriver.for target,options
      end
    end

    #
    # Returns the target and options including the capabilities
    #
    # @param  [String] the browser string passed into the method
    # @param [Hash] the optional hash to specify browser options
    # @return [Symbol,Hash] browser as symbol and options as Hash
    #

    def browser_caps(browser,browser_options)
      target = (browser.to_sym if ENV['BROWSER'].nil? or ENV['browser'].empty?) || (ENV['BROWSER'].to_sym)
      browser,version,platform,device = extract_values_from(target)
      options = {}
      options.merge! browser_options
      caps = capabilities(browser,version,platform,device)
      options[:url] = url if url
      if options.include? :url
        browser = :remote
        options[:desired_capabilities] = caps
      end
      options[:http_client] = http_client if persistent_http or options.delete(:persistent_http)
      return browser,options
    end


    def capabilities(browser, version, platform,device={})
      capabilities = Selenium::WebDriver::Remote::Capabilities.send browser
      capabilities.version = version unless version.nil? or version.empty?
      capabilities.platform = platform unless platform.nil? or platform.empty?
      capabilities.device = device unless device.nil? or device.empty?
      capabilities
    end

    #
    # Returns a persistent http connection object
    #
    # @return [Object] Persistent http connection object
    #

    def http_client
     client = Selenium::WebDriver::Remote::Http::Persistent.new
     #client.proxy_uri="http://abc"
     #client.read_timeout = 180
     #client.socket_options = {}
     client
    end


  end

end
