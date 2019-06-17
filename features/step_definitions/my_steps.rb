Given(/^I am on the home page$/) do
  @browser.goto 'http://localhost:3000'
end

When(/^I click on the puppy "([^"]*)"$/) do |name|
  @browser.div(text: name).parent.button(text: 'View Details').click
end

Then(/^I see "([^"]*)"$/) do |expected_text|
  expect(@browser.html.include?(expected_text)).to eq true
end

When(/^I click on "([^"]*)"$/) do |button_text|
  @browser.button(text: button_text).click
end

Then(/^I see the home page$/) do
  expect(@browser.h1(text: 'Puppy List')).to exist
end

Then(/^I see the puppy "([^"]*)" is in my litter$/) do |expected_name|
  expect(@browser.h2(text: "#{expected_name}:")).to exist
end

Given(/^I have added a puppy to my litter$/) do
  step 'I am on the home page'
  step 'I click on the puppy "Brook"'
  step 'I click on "Adopt Me!"'
end

When(/^I add a Collar & Leash to my order$/) do
  @browser.checkbox(id: 'collar').set(true)
end

When(/^I add a Chew Toy to my order$/) do
  @browser.checkbox(id: 'toy').set(true)
end

When(/^I fill the order form in with the following values:$/) do |order_table|
  order = order_table.hashes.first
  @browser.text_field(id: 'order_name').set(order['name'])
  @browser.textarea(id: 'order_address').set(order['address'])
  @browser.text_field(id: 'order_email').set(order['email'])
  @browser.select(id: 'order_pay_type').select(order['pay_type'])
end