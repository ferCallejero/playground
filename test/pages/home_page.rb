require 'rubygems'
require 'page'

class HomePage < Page
 
  page_url 'http://en.wikipedia.org'
  text_field(:txtSearch, :id => 'searchInput')
  button(:buttonSearch, :id => 'searchButton')
  
  def search(criteria)
    self.txtSearch= criteria
    self.buttonSearch
    article = ArticlePage.new(@browser)
  end
end