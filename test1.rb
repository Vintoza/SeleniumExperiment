#encoding: UTF-8
require "rubygems"
require 'test/unit'
require "selenium-webdriver"
require "page-object"
require "pages.rb"


class MyUnitTest  < Test::Unit::TestCase

	def login(name, password)
		@browser.find_element(:xpath => "//*[@id='quick_email']").send_keys name
		@browser.find_element(:xpath => "//*[@id='quick_pass']").send_keys password
		@browser.find_element(:xpath => "//*[@id='quick_login_button']").click 		
	end

	def setup
		@browser = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 3)
		@browser.navigate.to "http://vk.com"
		@browser.manage.timeouts.implicit_wait=(10)
		@login_page = LoginPage.new(@browser)
		@login_page.login_with('vintoza@mail.ru', 't15kf856juyt489sp1')
    end
    
    def teardown
       @browser.quit
    end

    def test_1	
		text_expected = 'Моя Страница'
		text_actual = @browser.find_element(:xpath => "//*[@id='myprofile']/span").text
		assert_equal text_actual, text_expected, "#{text_expected} != #{text_actual}" 
	end

	def test_2
		@browser.find_element(:xpath => "//*[@id='l_fr']/a/span[2]").click
		text_expected = 'У Вас 2 друга'
		text_actual = @browser.find_element(:xpath => "//*[@id='friends_summary']").text
		assert_equal text_actual, text_expected, "#{text_expected} != #{text_actual}"
	end

	def test_3
		@browser.find_element(:xpath => "//*[@id='l_msg']/a/span[2]").click
		value_expected = '6 диалогов'
		value_actual = @browser.find_element(:xpath => "//*[@id='im_dialogs_summary']/div").text
		assert_equal value_actual, value_expected, "#{value_expected} != #{value_actual}"
	end

	def test_4
		@browser.find_element(:xpath => "//*[@id='l_msg']/a/span[2]").click
		value_expected = true
		value_actual = @browser.find_element(:xpath => "//*[@id='tab_conversation']/a/b[3]").displayed?
		assert_equal value_actual, value_expected, "#{value_expected} != #{value_actual}"
	end
end

