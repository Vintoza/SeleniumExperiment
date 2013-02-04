class LoginPage
  include PageObject
 
  text_field(:email, :xpath => "//*[@id='quick_email']")
  text_field(:pass, :xpath => "//*[@id='quick_pass']")
  button(:login, :xpath => "//*[@id='quick_login_button']")
  span(:myprofile, :xpath => "//*[@id='myprofile']/span")

  def login_with(email, pass)
    self.email = email
    self.pass = pass
    login
  end
end

class FriendPage
  include PageObject

  span(:friend_button, :xpath => "//*[@id='l_fr']/a/span[2]")
  expected_element(:friend_button, 10)

  text_field(:friend_summary, :xpath => "//*[@id='friends_summary']")
end

class MessagePage
  include PageObject

  span(:message_button, :xpath => "//*[@id='l_msg']/a/span[2]")
  div(:none_message_text, :xpath => "//*[@id='im_rows_none']")

  button(:write_message, :xpath => "//*[@id='im_search_btn']")
  expected_element(:write_message, 10)
end

class SettingsPage
  include PageObject

  span(:document_button, :xpath => "//*[@id='l_set']/a/span[2]")
  div(:document, :xpath => "//*[@id='settings_services']/div[10]/div[2]")
end