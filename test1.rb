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
	 	text_actual = @login_page.myprofile_element.text
	 	assert_equal text_actual, text_expected, "#{text_expected} != #{text_actual}" 
	end

	def test_2
		@friends_page = FriendPage.new(@browser)
		@friends_page.friend_button_element.click
		text_expected = 'У Вас 2 друга'
		text_actual = @friends_page.friend_summary_element.text
		assert_equal text_actual, text_expected, "#{text_expected} != #{text_actual}"
	end

	def test_3
		@message_page = MessagePage.new(@browser)
		@message_page.message_button_element.click
		text_expected = '6 диалогов'
		text_actual = @message_page.dialogs_summary_element.text
		assert_equal text_actual, text_expected, "#{text_expected} != #{text_actual}"
	end

	def test_4
		@message_page = MessagePage.new(@browser)
		@message_page.message_button_element.click
		text_expected = true
	 	text_actual = @message_page.write_message?
	 	assert_equal text_actual, text_expected, "#{text_expected} != #{text_actual}"
	end
end