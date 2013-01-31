require "selenium-webdriver"
require "page-object"
require "test-unit"
require 'test/unit/assertions'

World(Test::Unit::Assertions)

Dir[File.dirname(__FILE__) + '/../../pages/*.rb'].each { |file| require file }

Before do

end

After do
  @browser.quit
end