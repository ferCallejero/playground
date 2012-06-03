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
    assert @playground.source.length > 0
  end
  
  def test_get_current_url
    home = HomePage.new(playground_browser)
    home.goto
    assert @playground.current_url.length > 0
  end
  
  def test_wikipedia_title
    home = HomePage.new(playground_browser)
    home.goto
    assert @playground.page_title.include? "Wikipedia"
  end
  
  def test_wikiedia_search
    home = HomePage.new(playground_browser)
    home.goto
    article = home.search 'uruguay'
    assert article.title == "Uruguay"
  end

end