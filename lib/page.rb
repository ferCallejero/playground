require 'page-object'
require 'playground'

class Page
  include PageObject
  
  def page_title
    @browser.title
  end
  
  def switch_to_frame(frame)
    @browser.switch_to.frame(frame)
  end
  
  def switch_to_default_content(frame)
    @browser.switch_to.default_content(frame)
  end
  
end