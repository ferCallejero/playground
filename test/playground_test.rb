require 'rubygems'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '.', 'pages'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'testcase'
require 'home_page'
require 'article_page'

class SmokeTest < TestCase
  
  def test_get_source
    home = HomePage.new(playground_browser)
    home.goto
    assert home.source.length > 0
  end
  
  def test_get_current_url
    home = HomePage.new(playground_browser)
    home.goto
    assert home.current_url.length > 0
  end
  
  def test_wikipedia_title
    home = HomePage.new(playground_browser)
    home.goto
    assert home.page_title.include? "Wikipedia"
  end
  
  def test_wikiedia_search
    home = HomePage.new(playground_browser)
    home.goto
    article = home.search('uruguay')
    assert article.title == "Uruguay"
  end
  
  def within_frame(frame_id)
    old_window = @browser.window_handle
    @browser.switch_to.frame(frame_id)
    yield
    @browser.switch_to.window old_window
  end
  

end