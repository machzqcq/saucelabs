require 'saucelabs'

When(/^I invoke chrome browser$/) do
  @browser = SauceLabs.selenium_driver(browser= :chrome)
end

Then(/^I hit google website$/) do
 @browser.navigate.to "http://www.google.com"
end

When(/^I invoke chrome browser and set environment variable$/) do
  ENV['BROWSER']= "chrome"
  @browser = SauceLabs.selenium_driver
end