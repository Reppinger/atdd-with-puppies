When(/^I click on the email icon$/) do
  @browser.link(name: 'contact').click
end

When(/^I fill the form in with the following values:$/) do |form_values|
  contact = form_values.hashes.first
  @browser.text_field(id: 'contact_message_name').set(contact['name'])
  @browser.text_field(id: 'contact_message_email').set(contact['email'])
  @browser.textarea(id: 'contact_message_body').set(contact['message'])
end

When(/^the contact form is completely filled in$/) do
  steps %Q{
      When I fill the form in with the following values:
      | name        | email           | message                                            |
      | Joe Sixpack | joe@sixpack.com | I am having trouble adopting a puppy. Please help! |
  }
end

When(/^I blank out "([^"]*)"$/) do |element_id|
  element = @browser.element(id: element_id).wd
  if element.tag_name == 'select'
    @browser.select(id: element_id).select_value('')
  else
    element.clear
  end
end
