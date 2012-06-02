require 'rubygems'
require 'test/unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class TestCase < Test::Unit::TestCase
  
  @browser
  
  # Starting browser before each test
  def setup    
    PlayGround.instance.create_browser('firefox')
    PlayGround.instance.set_implicit_wait(30)
    @browser = PlayGround.instance.browser
  end

  # Closing browser after each test
  def teardown
    @browser.quit
  end
  
end