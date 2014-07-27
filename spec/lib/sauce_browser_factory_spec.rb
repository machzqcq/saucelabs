require 'spec_helper'
require 'selenium/webdriver/remote/http/persistent'

describe SauceLabs do

  let(:watir_browser) { Watir::Browser }

  context "Create Watir browser" do
    it "should create a firefox instance if none specified" do
      expect(watir_browser).to receive(:new).with(:firefox)
      SauceLabs.watir_browser
    end

    it "should create a chrome instance if chrome specified" do
      expect(watir_browser).to receive(:new).with(:chrome)
      SauceLabs.watir_browser(:chrome)
    end

    it "should create a ie instance if ie specified" do
      expect(watir_browser).to receive(:new).with(:ie)
      SauceLabs.watir_browser(:ie)
    end
  end

  context "Create Selenium driver" do
    let(:selenium_driver) { Selenium::WebDriver }

    it "should create a firefox instance if non specified" do
      expect(selenium_driver).to receive(:for).with(:firefox)
      SauceLabs.selenium_driver
    end

    it "should create a chrome instance if chrome specified" do
      expect(selenium_driver).to receive(:for).with(:chrome)
      SauceLabs.selenium_driver(:chrome)
    end

    it "should create a ie instance if ie specified" do
      expect(selenium_driver).to receive(:for).with(:ie)
      SauceLabs.selenium_driver(:ie)
    end
  end


  context "Using an environment variable BROWSER" do
    it "uses ENV['BROWSER'] if available" do
      ENV['BROWSER'] = 'chrome'
      expect(watir_browser).to receive(:new).with(:chrome)
      SauceLabs.watir_browser
      ENV.delete 'BROWSER'
    end

    it "should provide option to use http client for watir" do
      client = double('http_client')
      expect(Selenium::WebDriver::Remote::Http::Persistent).to receive(:new).and_return(client)
      expect(watir_browser).to receive(:new).with(:firefox, http_client: client)
      SauceLabs.watir_browser(:firefox, persistent_http: true)
    end

    it "should provide option to use http_client via conf" do
      SauceLabs.conf do |conf|
        conf.persistent_http = true
      end
      client = double('http_client')
      expect(Selenium::WebDriver::Remote::Http::Persistent).to receive(:new).and_return(client)
      expect(watir_browser).to receive(:new).with(:firefox, http_client: client)
      SauceLabs.watir_browser(:firefox)
      SauceLabs.conf do |conf|
        conf.persistent_http = nil
      end
    end

    it "should provide to use sauce labs url using conf" do
      SauceLabs.conf do |conf|
        conf.url = 'http://username:password@ip:port/wd/hub'
      end
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser(:firefox)
      SauceLabs.conf do |conf|
        conf.url = nil
      end
    end
  end
  context "can pass browser options" do
    it "should provide to be able to pass firefox browser options" do
      SauceLabs.conf do |conf|
        conf.options = {options: 'blah'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      SauceLabs.watir_browser(:firefox)
      SauceLabs.conf do |conf|
        conf.options = nil
      end
    end

    it "should provide to be able to pass chrome browser options" do
      SauceLabs.conf do |conf|
        conf.options = {options: 'blah'}
      end
      expect(watir_browser).to receive(:new).with(:chrome)
      SauceLabs.watir_browser(:chrome)
      SauceLabs.conf do |conf|
        conf.options = nil
      end
    end

    it "should provide to be able to pass ie browser options" do
      SauceLabs.conf do |conf|
        conf.options = {options: 'blah'}
      end
      expect(watir_browser).to receive(:new).with(:ie)
      SauceLabs.watir_browser(:ie)
      SauceLabs.conf do |conf|
        conf.options = nil
      end
    end
  end


 end