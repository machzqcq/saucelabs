require_relative 'parsed_values'

module SauceLabs
  class SauceBrowserFactory
    include ParsedValues

    attr_accessor :url,:browser_options

    def watir_browser(browser,browser_options)
      target,options = browser_caps(browser,browser_options)
      create_watir_browser(target,options)
    end

    def selenium_browser(browser,browser_options)
      target,options = browser_caps(browser,browser_options)
      create_selenium_browser(target,options)
    end

    def create_watir_browser(target,options)
      if options.empty?
        Watir::Browser.new target
      else
        Watir::Browser.new target,options
      end
    end

    def create_selenium_browser(target,options)
      if options.empty?
        Selenium::WebDriver.for target
      else
        Selenium::WebDriver.for target,options
      end
    end

    def capabilities(browser, version, platform)
      capabilities = Selenium::WebDriver::Remote::Capabilities.send browser
      capabilities.version = version unless version.nil?
      capabilities.platform = platform unless platform.nil?
      capabilities
    end

    def self.http_client
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 180
      client
    end

    def browser_caps(browser,browser_options)
      browser = ENV['browser'].to_sym if ENV['browser']
      browser,version,platform = extract_values_from(browser)
      options = {}
      options.merge! browser_options
      caps = capabilities(browser,version,platform)
      options[:url] = url
      if options.include? :url
        target = :remote
        options[:desired_capabilities] = caps
      end
      options[:http_client] = '' unless http_client
      return target,options
    end

  end

end