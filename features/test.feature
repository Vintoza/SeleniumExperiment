Feature:  Search and navigate to the web element

Background:
  Given I start chrome browser and go to "http://vk.com"
  And I login with "vintoza@mail.ru", "t15kf856j"

Scenario: Search button "my profile"
  Then I know that text in element "myprofile" should be = "Моя Страница"

Scenario: Search an element "friends summary"
  When I go to "friend list"
  Then I know that text in element "friends_summary" should be = "У Вас 2 друга"
     
Scenario: Seach an element "non message"
  When I go to "message list"
  Then I know an element "im rows none" are displayed

Scenario: Seach a button "write message"
  When I go to "message list"
  Then I know an element "write message" are displayed
