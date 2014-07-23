require_relative 'parsed_values'

module SauceModule
  class SauceBrowserFactory
    include ParsedValues

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

  end

end