require 'singleton'
require "selenium-webdriver"

class PlayGround

  attr_accessor :browser
  def create_firefox_driver
    @browser = Selenium::WebDriver.for :firefox
  end

  def create_firefox_driver_remote
    @browser = Selenium::WebDriver.for(:remote, :desired_capabilities => :firefox)
  end

  def create_opera_driver
    @browser = Selenium::WebDriver.for :opera
  end

  def create_opera_driver_remote
    @browser = Selenium::WebDriver.for(:remote, :desired_capabilities => :opera)
  end
  
  def create_safari_driver
    @browser = Selenium::WebDriver.for :safari
  end
  
  def create_safari_driver_remote
    @browser = Selenium::WebDriver.for(:remote, :desired_capabilities => :safari)
  end

  def create_chrome_driver
    @browser = Selenium::WebDriver.for :chrome
  end

  def create_chrome_driver_remote
    @driver = Selenium::WebDriver.for(:remote, 
                                      :desired_capabilities => :chrome)
  end

  public

  def create_browser(browser_name)
    case browser_name
    when 'firefox'
      create_firefox_driver
    when 'firefox_remote'
      create_firefox_driver_remote
    when 'opera'
      create_opera_driver
    when 'opera_remote'
      create_opera_driver_remote
    when 'safari'
      create_safari_driver
    when 'safari_remote'
      create_safari_driver_remote
    when 'chrome'
      create_chrome_driver
    when 'chrome_remote'
      create_chrome_driver_remote
    else
    puts 'Wrong Browser selected'
    end
  end

  def set_implicit_wait(seconds_to_wait)
    @browser.manage.timeouts.implicit_wait = seconds_to_wait
  end

  def reset!
    if @browser
      begin @browser.manage.delete_all_cookies
      rescue Selenium::WebDriver::Error::UnhandledError
      end
      @browser.navigate.to('about:blank')
    end
  end

  def page_title
    @browser.title
  end

  def switch_to_frame(frame)
    @browser.switch_to.frame(frame)
  end

  def switch_to_default_content
    @browser.switch_to.default_content
  end

  def source
    @browser.page_source
  end

  def current_url
    @browser.current_url
  end

  def within_frame(frame_id)
    old_window = @browser.window_handle
    @browser.switch_to.frame(frame_id)
    yield
    @browser.switch_to.window old_window
  end

  def quit
    @browser.quit
  end

end