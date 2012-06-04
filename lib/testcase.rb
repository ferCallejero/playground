require 'rubygems'
require 'playground'
require 'test/unit'

class TestCase < Test::Unit::TestCase 
  
  attr_accessor :playground
  
  # Starting browser before each test
  def setup    
    @playground = PlayGround.new
    @playground.create_browser('firefox')
    @playground.set_implicit_wait(30)
  end

  # Closing browser after each test
  def teardown
    @playground.browser.quit
  end
  
  private
  def playground_browser
    @playground.browser
  end
  
end