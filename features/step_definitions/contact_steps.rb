When(/^I click on the email icon$/) do
  @browser.link(name: 'contact').click
end

And(/^I fill the form in with the following values:$/) do |form_values|
  contact = form_values.hashes.first
  @browser.text_field(id: 'contact_message_name').set(contact['name'])
  @browser.text_field(id: 'contact_message_email').set(contact['email'])
  @browser.textarea(id: 'contact_message_body').set(contact['message'])
end