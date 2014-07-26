require_relative 'parsed_values'
require 'selenium-webdriver'
require 'watir-webdriver'

module SauceLabs
  class SauceBrowserFactory
    include ParsedValues

    attr_accessor :url,:options,:persistent_http

    def watir_browser(browser,browser_options)
      target,options = browser_caps(browser,browser_options)
      create_watir_browser(target,options)
    end

    def selenium_driver(browser,browser_options)
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

    def http_client
     client = Selenium::WebDriver::Remote::Http::Persistent.new
     #client.proxy_uri="http://abc"
     #client.read_timeout = 180
     #client.socket_options = {}
     client
    end


  end

end