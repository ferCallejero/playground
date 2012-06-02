require 'rubygems'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '.', 'pages'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'testcase'
require 'home_page'
require 'article_page'

class TestNavigation < TestCase
  
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

end