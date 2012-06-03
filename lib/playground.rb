require 'singleton'
require "selenium-webdriver"

class PlayGround
  include Singleton

  attr_accessor :browser

  private
  def create_firefox_driver
    @browser = Selenium::WebDriver.for :firefox
  end

  def create_opera_driver
    @browser = Selenium::WebDriver.for :opera
  end

  def create_safari_driver
    @browser = Selenium::WebDriver.for :safari
  end

  public

  def create_browser(browser_name)
    case browser_name
    when 'firefox'
      create_firefox_driver
    when 'opera'
      create_opera_driver
    when 'safari'
      create_safari_browser
    else
    puts 'Wrong Browser selected'
    end
  end

  def set_implicit_wait(seconds_to_wait)
    @browser.manage.timeouts.implicit_wait = seconds_to_wait
  end

  def reset!
    # Use instance variable directly so we avoid starting the browser just to reset the session
    if @browser
      begin @browser.manage.delete_all_cookies
      rescue Selenium::WebDriver::Error::UnhandledError
        # delete_all_cookies fails when we've previously gone
        # to about:blank, so we rescue this error and do nothing
        # instead.
      end
      @browser.navigate.to('about:blank')
    end
  end
  
  def quit
    @browser.quit
  end

end