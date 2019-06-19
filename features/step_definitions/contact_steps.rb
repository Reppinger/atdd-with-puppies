When(/^I click on the email icon$/) do
  @browser.link(name: 'contact').click
end

And(/^I fill in the contact form with the following values:$/) do |contact_table|
  contact = contact_table.hashes.first
  @browser.text_field(id: 'contact_message_name').set(contact['name'])
  @browser.text_field(id: 'contact_message_email').set(contact['email'])
  @browser.textarea(id: 'contact_message_body').set(contact['message'])
end

And(/^the contact form is completely filled in$/) do
  steps %Q{
    And I fill in the contact form with the following values:
    | name        | email           | message                                            |
    | Joe Sixpack | joe@sixpack.com | I am having trouble adopting a puppy. Please help! |
  }
end

But(/^I blank out "([^"]*)"$/) do |element_id|
  element = @browser.element(id: element_id).wd
  if element.tag_name == "select"
    @browser.select(id: element_id).select_value('')
  else
    element.clear
  end
end