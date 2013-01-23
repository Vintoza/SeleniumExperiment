class LoginPage
	include PageObject
 
	text_field(:email, :xpath => "//*[@id='quick_email']")
	text_field(:pass, :xpath => "//*[@id='quick_pass']")
	button(:login, :xpath => "//*[@id='quick_login_button']")

	def login_with(email, pass)
    	self.email = email
    	self.pass = pass
    	login
	end
end

class FriendList
	include PageObject

	element(:link, :xpath => "//*[@id='l_fr']/a/span[2]")
	
	expected_element(:link, 10)

end

class MessagePage
	include PageObject

	element(:link, :xpath => "//*[@id='l_msg']/a/span[2]")
	element(:text, :xpath => "//*[@id='im_dialogs_summary']/div")
	
	expected_element(:text, 10)
	
end