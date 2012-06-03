require 'singleton'
require "selenium-webdriver"

class PlayGround
  
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