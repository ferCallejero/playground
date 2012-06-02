require 'singleton'
require "selenium-webdriver"

class PlayGround
  include Singleton
  attr_accessor :browser
  
  def create_firefox_driver
    @browser = Selenium::WebDriver.for :firefox
  end

  def create_opera_driver
    @browser = Selenium::WebDriver.for :opera
  end

  def create_safari_driver
    @browser = Selenium::WebDriver.for :safari
  end

  def set_implicit_wait(seconds_to_wait)
    @browser.manage.timeouts.implicit_wait = seconds_to_wait
  end

  def setup(browser)
    case browser
    when 'firefox'
      create_firefox_driver
    when 'opera'
      create_opera_driver
    when 'safari'
      create_safari_browser
    else
    puts 'Wrong Browser'
    end
  end
end