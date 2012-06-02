require 'rubygems'
require 'test/unit'
require 'page-object'
require 'pages/home_page'
require 'pages/article_page'
require 'page-object/page_factory'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'playground'

class TestNavigation < Test::Unit::TestCase
  
   def test_google_search
    PlayGround.instance
    PlayGround.instance.setup('firefox')
    PlayGround.instance.set_implicit_wait(30)
    
    home = HomePage.new(PlayGround.instance.browser)
    home.goto
    article = home.search('uruguay')
    
    assert article.title == "Uruguay"
  end
  
  
end
