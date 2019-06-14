Given(/^I am on the home page$/) do
  @browser.goto 'http://localhost:3000'
end

When(/^I click on the puppy "([^"]*)"$/) do |name|
  @browser.div(text: name).parent.button(text: 'View Details').click
end

Then(/^I see "([^"]*)"$/) do |expected_text|
  expect(@browser.html.include?(expected_text)).to eq true
end

And(/^I click on "([^"]*)"$/) do |button_text|
  @browser.button(text: button_text).click
end

Then(/^I see the home page$/) do
  expect(@browser.h1(text: 'Puppy List')).to exist
end