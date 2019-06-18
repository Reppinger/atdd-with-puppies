When(/^I click on the email icon$/) do
  @browser.link(name: 'contact').click
end

And(/^I fill in the contact form with the following values:$/) do |contact_table|
  contact = contact_table.hashes.first
  @browser.text_field(id: 'contact_message_name').set(contact['name'])
  @browser.text_field(id: 'contact_message_email').set(contact['email'])
  @browser.textarea(id: 'contact_message_body').set(contact['message'])
end