module SauceLabs
  module ParsedValues

    def extract_values_from(browser_string)
      browser = extract_browser(browser_string).to_sym
      version = extract_version(browser_string)
      platform = extract_platform(browser_string)
      device = extract_device(browser_string)
      return browser,version,platform,device
    end

    private

    def extract_browser(value)
      browser = value.to_s.split(/\d+/)[0]
      browser = browser.to_s.split('|')[0] if browser.to_s.include? '|'
      browser
    end

    def extract_version(value)
      value = value.to_s.split('|')[0] if value.to_s.include? '|'
      regexp_to_match = /\d{1,}/
      if (not regexp_to_match.match(value).nil?)
        version = regexp_to_match.match(value)[0]
      else
        version = ''
      end
      version
    end

    def extract_platform(value)
      platform = value.to_s.split('|')[1] if value.to_s.include? '|'
      sauce_platforms
      @sauce_platforms[platform] if not platform.nil?
    end

    def extract_device(value)
      device = value.to_s.split('|')[2] if value.to_s.include? '|'
      sauce_devices
      @sauce_devices[device] if not device.nil?
    end

    def sauce_platforms
      @sauce_platforms = Hash.new
      @sauce_platforms["windowsxp"] = "Windows XP"
      @sauce_platforms["osx109"] = "OS X 10.9"
      @sauce_platforms["osx106"] = "OS X 10.6"
      @sauce_platforms["osx108"] = "OS X 10.8"
      @sauce_platforms["linux"] = "Linux"
      @sauce_platforms["windows81"] = "Windows 8.1"
      @sauce_platforms["windows8"] = "Windows 8"
      @sauce_platforms["windows7"] = "Windows 7"
    end

    def sauce_devices
      @sauce_devices = Hash.new
      @sauce_devices["iphone"] = "iPhone"
      @sauce_devices["android"] = "Android"
    end

  end
end