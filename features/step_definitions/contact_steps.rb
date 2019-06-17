When(/^I click on the email icon$/) do
  @browser.link(name: 'contact').click
end

When(/^I fill the form in with the following values:$/) do |form_values|
  contact_page = ContactPage.new(@browser)
  contact = form_values.hashes.first
  contact_page.fill_form(contact)
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


Then(/^I see the heading "([^"]*)"$/) do |expected_heading|
  page = ContactPage.new(@browser)
  expect(page.heading_displayed?(expected_heading)).to eq true
end
