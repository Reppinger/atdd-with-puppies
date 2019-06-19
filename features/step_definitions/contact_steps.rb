When(/^I click on the email icon$/) do
  @browser.link(name: 'contact').click
end

When(/^I fill the form in with the following values:$/) do |form_values|
  contact_page = ContactPage.new(@browser)
  contact = form_values.hashes.first
  contact_page.fill_form contact['name'], contact['email'], contact['message']
end

When(/^the contact form is completely filled in$/) do
  contact_page = ContactPage.new(@browser)
  contact_page.fill_form Faker::Superhero.name, Faker::Internet.email, Faker::Shakespeare.hamlet_quote
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


Then(/^a contact confirmation is displayed$/) do
  home_page = HomePage.new(@browser)
  expect(home_page.contact_confirmed?).to eq true
end