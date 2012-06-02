require 'page-object'
require "selenium-webdriver"

require 'playground'

class ArticlePage
  include PageObject
 
  h1(:title, :id => 'firstHeading')
  
end