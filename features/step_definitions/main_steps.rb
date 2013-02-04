Given /^I start chrome browser and go to "(.*?)"$/ do |url|
  @browser = Selenium::WebDriver.for :chrome
  @browser.navigate.to url
  @browser.manage.timeouts.implicit_wait=(10)
end

When /^I login with "([^"]*)", "([^"]*)"$/ do |login, password|
  login_page = LoginPage.new(@browser)
  login_page.login_with login, password
end

When /^I go to "([^"]*)"$/ do |page|
  if page == "friend list"
    friends_page = FriendPage.new(@browser)
    friends_page.friend_button_element.click
  elsif page == "settings list"
    settings_page = SettingsPage.new(@browser)
    settings_page.document_button_element.click
  else
    message_page = MessagePage.new(@browser)
    message_page.message_button_element.click
  end
end

Then /^I know that text in element "([^"]*)" should be = "([^"]*)"$/ do |element, text|
  text_expected = text
  if element == "friends_summary"
    friends_page = FriendPage.new(@browser)
    text_actual = friends_page.friend_summary_element.text
  elsif element == "myprofile"
    login_page = LoginPage.new(@browser)
    text_actual = login_page.myprofile_element.text
  else
    text_actual = nil
  end
  assert_equal text_expected, text_actual, "#{text_expected} != #{text_actual}"
end

Then /^I know an element "([^"]*)" are displayed$/ do |element|
  text_expected = true
  message_page = MessagePage.new(@browser)
  if element == "im rows none"
    text_actual = message_page.none_message_text?
  elsif element == "write message"
    text_actual = message_page.write_message?
  else
    text_actual = nil
  end
  assert_equal text_expected, text_actual, "#{text_expected} != #{text_actual}"
end

When /^I checking "([^"]*)"$/ do |document|
  if document == "checkdoc"
    @settings_page = SettingsPage.new(@browser)
    @settings_page.document_element.click
  end
end

Then /^I verificate that checkbox is "([^"]*)"$/ do |chek|
  if chek == "checked"
    text_actual = @settings_page.document_element.attribute("class").include? " on"
  else
    text_actual = nil
  end
  text_expected = true
  assert_equal text_expected, text_actual, "#{text_expected} != #{text_actual}"
end