# SauceLabs

saucelabs gem is written in simple ruby so as to be able to set the desired capabilities for selenium/watir grid execution
and also be able to dynamically set the browser choice through an environment variable and execute the same scripts across browsers.
Also platform and device parameters in the desired capabilities object when creating a connection to
Sauce Labs. It can also be used to create a connection to local browser instance in addition to Sauce Labs
The gem has been tested on MRI ruby and JRuby. Please report any issues and I will try my best to fix asap.

## Background

saucelabs gem is intended to be able to extract 4 main parameters viz. browser, version, platform and device
that gets set in the desired capabilities object. The gem creation got inspired by the below blog post
http://seleniumframework.wordpress.com/2014/05/18/pattern-for-running-multiple-cucumber-projects-on-ci-server/

````ruby
require 'saucelabs'
SauceLabs.watir_browser(browser = :firefox, browser_options = {})
# or
require 'saucelabs'
SauceLabs.selenium_driver(browser = :firefox, browser_options = {})
````
The methods use firefox as default browser and browser_options as optional parameter. You can specify other browsers
by the following:
````ruby
SauceLabs.watir_browser(browser = :chrome, browser_options = {})
# or
SauceLabs.selenium_driver(browser = :chrome, browser_options = {})
````

Another example of being able to use chrome 35 on Windows8 platform (The :url needs to be set using SauceLabs.conf, see below)
````ruby
SauceLabs.watir_browser(browser = :'chrome35|windows8', browser_options = {})
# or
SauceLabs.selenium_driver(browser = :'chrome35|windows8', browser_options = {})
````


Yet Another example of being able to use chrome on mac platform and Android device (The :url needs to be set using SauceLabs.conf, see below)
````ruby
SauceLabs.watir_browser(browser = :'chrome|linux|android', browser_options = {})
# or
SauceLabs.selenium_driver(browser = :'chrome|linux|android', browser_options = {})
````

Yet Another example of being able to use safari on mac platform and iphone device (The :url needs to be set using SauceLabs.conf, see below)
````ruby
SauceLabs.watir_browser(browser = :'chrome|linux|iphone', browser_options = {})
# or
SauceLabs.selenium_driver(browser = :'chrome|linux|iphone', browser_options = {})
````

A simple ruby code example:

````ruby
require 'saucelabs'
include SauceLabs

ENV['BROWSER'] = "chrome"
@browser = SauceLabs.watir_browser
@browser.goto "http://www.google.com"
@browser.quit
````


### Set BROWSER environment variable

In the above section, we have seen that it is very easy to set browser as a symbol
to the methods watir_browser and selenium_driver. However we would most likely want to dynamically set
the browser value. saucelabs reads from an environment variable 'BROWSER'. The following examples would help
understand the patterns. We can either use cucumber.yml file or set it on the command line as per your choice

````yml
default: BROWSER=firefox --format pretty --color
chrome: BROWSER=chrome --format pretty --color
ie: BROWSER=ie --format pretty --color
````

Execution from command line is simple too:

````
cucumber BROWSER=chrome features
````

The string pattern that is followed by this gem is as follows (Observer the '|' delimiter):


````
chrome36|win81
safari|linux|iphone
chrome|linux|android
````

Hence the following also applies:

````yml
default: BROWSER=chrome36|win81 --format pretty --color
safari_mac: BROWSER=safari|linux|iphone --format pretty --color
chrome_android: BROWSER=chrome|linux|android --format pretty --color
````



The first part determines the browser and its version
The second part determines the platform value that is set in capabilities object
The third part (used only for mobile device testing) determines the device



The following table is a mapping of all the platforms available on Sauce Labs website

| platform | description |
| --- | --- |
| windowsxp | Windows XP |
| osx109 | OS X 10.9 |
| osx106 | OS X 10.6 |
| osx108 | OS X 10.8 |
| linux | Linux |
| windows81 | Windows 8.1 |
| windows8 | Windows 8 |
| windows7 | Windows 7 |

The platform values can also be obtained from https://saucelabs.com/platforms

The following table is a mapping of all the devices available on Sauce Labs website

| device | description |
| --- | --- |
| iphone | iPhone |
| android | Android |


### Setting parameters using a block

We can also set parameters like sauce url, http_persistent and browser options. Below are some examples:


````ruby
SauceLabs.conf do | conf|
  conf.url = 'http://username:password@ip:port/wd/hub' #Saucelabs connection url
  conf.persistent_http = true
  conf.browser_options = { :switches => %w[--disable-extensions],:chromeOptions => {"args" => ["test-type" ]}}
end
````

## Documentation

You can view the RDocs for this project [here] (http://rubydoc.info/github/machzqcq/saucelabs/master/frames).

## Installation

Add this line to your application's Gemfile:

    gem 'saucelabs'

And then execute:

    $ bundle

Require the module:

require 'saucelabs'

Or install it yourself as:

    $ gem install saucelabs


## Contributing

1. Fork it ( https://github.com/[my-github-username]/rd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request