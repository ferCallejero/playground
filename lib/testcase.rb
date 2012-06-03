require 'rubygems'
require 'playground'
require 'test/unit'

module PlayGround
class TestCase < Test::Unit::TestCase 
  
  # Starting browser before each test
  def setup    
    PlayGround.instance.create_browser('firefox')
    PlayGround.instance.set_implicit_wait(30)
  end

  # Closing browser after each test
  def teardown
    PlayGround.instance.browser.quit
  end
  
  def playground_browser
    PlayGround.instance.browser
  end
  
end
end