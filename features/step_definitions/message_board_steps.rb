When(/^I visit the Message Boards$/) do
  @browser.link(name: 'message-boards').click
end

And(/^I post the message:$/) do |message_table|
  message_page = MessageBoardsPage.new(@browser)
  message = message_table.hashes.first
  message_page.post(message['nickname'], message['body'])
end

Then(/^the post with "([^"]*)" is displayed$/) do |expected_body|
  message_page = MessageBoardsPage.new(@browser)
  expect(message_page.post_found?(expected_body)).to eq true
end