require 'spec_helper'

class TestParsedValues
  include SauceLabs::ParsedValues
end


describe SauceLabs::ParsedValues do

  let(:parsed_values) { TestParsedValues.new }

  it "should extract browser name" do
    browser, version, platform,device = parsed_values.extract_values_from(:chrome)
    expect(browser).to eql :chrome
  end

  it "should extract browser name if browser and version are specified" do
    browser, version, platform,device = parsed_values.extract_values_from(:chrome35)
    expect(browser).to eql :chrome
  end

  it "should extract version if version is specified along with browser" do
    browser,version,platform,device = parsed_values.extract_values_from(:chrome35)
    expect(version).to eql '35'
  end

  it "should extract platform if platform is specified along with browser" do
    browser, version, platform,device = parsed_values.extract_values_from(:'chrome35|windows81')
    expect(platform).to eql 'Windows 8.1'
  end

  it "should extract iphone device if iphone is specified along with platform and browser" do
    browser, version, platform,device = parsed_values.extract_values_from(:'chrome35|windows81|iphone')
    expect(device).to eql 'iPhone'
  end

  it "should extract android device if android is specified along with platform and browser" do
    browser, version, platform,device = parsed_values.extract_values_from(:'chrome35|windows81|android')
    expect(device).to eql 'Android'
  end

  it "should report platform nil if platform is not defined in sauce_platforms" do
    browser, version, platform,device = parsed_values.extract_values_from(:'chrome35|windows82|android')
    expect(platform).to be_nil
  end

  it "should report device nil if device is not defined in sauce_devices" do
    browser, version, platform,device = parsed_values.extract_values_from(:'chrome35|windows82|xyz')
    expect(device).to be_nil
  end

end