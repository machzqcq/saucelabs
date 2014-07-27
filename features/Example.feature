Feature: Using saucelabs gem to invoke a local browser instance
  Scenario: launch chrome browser locally
    When I invoke chrome browser
    Then I hit google website
  Scenario: launch chrome browser locally using environment variable
    When I invoke chrome browser and set environment variable
    Then I hit google website