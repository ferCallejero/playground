require 'page-object'
require "selenium-webdriver"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'playground'

class ArticlePage
  include PageObject
 
  h1(:title, :id => 'firstHeading')
  
end