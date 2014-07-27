require 'spec_helper'

describe "Example browser, platform and device combinations" do

  let(:watir_browser) { Watir::Browser }
  let(:selenium_driver) { Selenium::WebDriver}
  let(:capabilities) { Selenium::WebDriver::Remote::Capabilities }
  let(:desired_capabilities) { double('capabilities') }

  context "Firefox" do

    before(:each) do
      allow(capabilities).to receive(:firefox).and_return(desired_capabilities)
    end

    it "allows Firefox with no version specified" do
      expect(watir_browser).to receive(:new).with(:firefox)
      SauceLabs.watir_browser :firefox
    end

    it "allows Firefox 3" do
      expect(desired_capabilities).to receive(:version=).with('3')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox3, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Firefox 6" do
      expect(desired_capabilities).to receive(:version=).with('6')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox6, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Firefox 10" do
      expect(desired_capabilities).to receive(:version=).with('10')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox10, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Firefox 25" do
      expect(desired_capabilities).to receive(:version=).with('25')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox25, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Firefox 28" do
      expect(desired_capabilities).to receive(:version=).with('28')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox28, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Firefox 29" do
      expect(desired_capabilities).to receive(:version=).with('29')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox29, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Firefox 30" do
      expect(desired_capabilities).to receive(:version=).with('30')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :firefox30, url: 'http://username:password@ip:port/wd/hub'
    end

  end

  context "Chrome" do

    before(:each) do
      allow(capabilities).to receive(:chrome).and_return(desired_capabilities)
    end

    it "allows Chrome with no version specified" do
      expect(watir_browser).to receive(:new).with(:chrome)
      SauceLabs.watir_browser :chrome
    end

    it "allows Chrome 26" do
      expect(desired_capabilities).to receive(:version=).with('26')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome26, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Chrome 27" do
      expect(desired_capabilities).to receive(:version=).with('27')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome27, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Chrome 28" do
      expect(desired_capabilities).to receive(:version=).with('28')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome28, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Chrome 29" do
      expect(desired_capabilities).to receive(:version=).with('29')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome29, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Chrome 30" do
      expect(desired_capabilities).to receive(:version=).with('30')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome30, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Chrome 32" do
      expect(desired_capabilities).to receive(:version=).with('32')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome32, url: 'http://username:password@ip:port/wd/hub'
    end

    it "allows Chrome 36" do
      expect(desired_capabilities).to receive(:version=).with('36')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://username:password@ip:port/wd/hub', desired_capabilities: anything())
      SauceLabs.watir_browser :chrome36, url: 'http://username:password@ip:port/wd/hub'
    end

end
    context "Platforms Windows" do
      before(:each) do
        allow(capabilities).to receive(:chrome).and_return(desired_capabilities)
      end

      it "extracts Windows XP" do
        expect(desired_capabilities).to receive(:version=).with('26')
        expect(desired_capabilities).to receive(:platform=).with('Windows XP')
        expect(watir_browser).to receive(:new)
        SauceLabs.watir_browser :'chrome26|windowsxp', url: 'http://username:password@ip:port/wd/hub'
      end

      it "extracts Windows 8.1" do
        expect(desired_capabilities).to receive(:version=).with('35')
        expect(desired_capabilities).to receive(:platform=).with('Windows 8.1')
        expect(watir_browser).to receive(:new)
        SauceLabs.watir_browser :'chrome35|windows81', url: 'http://username:password@ip:port/wd/hub'
      end

      it "extracts Windows 7" do
        expect(desired_capabilities).to receive(:version=).with('33')
        expect(desired_capabilities).to receive(:platform=).with('Windows 7')
        expect(watir_browser).to receive(:new)
        SauceLabs.watir_browser :'chrome33|windows7', url: 'http://username:password@ip:port/wd/hub'
      end

      it "extracts Windows 8" do
        expect(desired_capabilities).to receive(:version=).with('36')
        expect(desired_capabilities).to receive(:platform=).with('Windows 8')
        expect(watir_browser).to receive(:new)
        SauceLabs.watir_browser :'chrome36|windows8', url: 'http://username:password@ip:port/wd/hub'
      end
    end


  context "Platforms OS X" do
    before(:each) do
      allow(capabilities).to receive(:safari).and_return(desired_capabilities)
    end

    it "extracts OS X 10.9" do
      expect(desired_capabilities).to receive(:version=).with('7')
      expect(desired_capabilities).to receive(:platform=).with('OS X 10.9')
      expect(watir_browser).to receive(:new)
      SauceLabs.watir_browser :'safari7|osx109', url: 'http://username:password@ip:port/wd/hub'
    end

    it "extracts OS X 10.6" do
      expect(desired_capabilities).to receive(:version=).with('6')
      expect(desired_capabilities).to receive(:platform=).with('OS X 10.6')
      expect(watir_browser).to receive(:new)
      SauceLabs.watir_browser :'safari6|osx106', url: 'http://username:password@ip:port/wd/hub'
    end

    it "extracts OS X 10.8" do
      expect(desired_capabilities).to receive(:version=).with('5')
      expect(desired_capabilities).to receive(:platform=).with('OS X 10.8')
      expect(watir_browser).to receive(:new)
      SauceLabs.watir_browser :'safari5|osx108', url: 'http://username:password@ip:port/wd/hub'
    end

end

  context "Platforms Linux" do
    before(:each) do
      allow(capabilities).to receive(:chrome).and_return(desired_capabilities)
    end

    it "extracts Linux" do
      expect(desired_capabilities).to receive(:version=).with('36')
      expect(desired_capabilities).to receive(:platform=).with('Linux')
      expect(watir_browser).to receive(:new)
      SauceLabs.watir_browser :'chrome36|linux', url: 'http://username:password@ip:port/wd/hub'
    end
  end

  context "Extract device" do
      it "extracts iPhone" do
      allow(capabilities).to receive(:chrome).and_return(desired_capabilities)
      expect(desired_capabilities).to receive(:platform=).with('Linux')
      expect(desired_capabilities).to receive(:device=).with('iPhone')
      expect(watir_browser).to receive(:new)
      SauceLabs.watir_browser :'chrome|linux|iphone', url: 'http://username:password@ip:port/wd/hub'
    end

    it "extracts Android" do
      allow(capabilities).to receive(:chrome).and_return(desired_capabilities)
      expect(desired_capabilities).to receive(:platform=).with('Linux')
      expect(desired_capabilities).to receive(:device=).with('Android')
      expect(selenium_driver).to receive(:for)
      SauceLabs.selenium_driver :'chrome|linux|android', url: 'http://username:password@ip:port/wd/hub'
    end
  end

end