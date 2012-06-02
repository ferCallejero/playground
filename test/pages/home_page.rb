require 'page-object'
require "selenium-webdriver"

class HomePage
  include PageObject
 
  page_url 'http://en.wikipedia.org'
  text_field(:txtSearch, :id => 'searchInput')
  button(:buttonSearch, :id => 'searchButton')
  
  def search(criteria)
    self.txtSearch= criteria
    self.buttonSearch
    @article = ArticlePage.new(PlayGround.instance.browser)
  end
end