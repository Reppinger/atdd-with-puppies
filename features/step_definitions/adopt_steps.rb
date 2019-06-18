When(/^I click on the puppy "([^"]*)"$/) do |name|
  @browser.div(text: name).parent.button.click
end

Then(/^I see "([^"]*)"$/) do |expected_text|
  text_found = @browser.html.include?(expected_text)
  expect(text_found).to eq true
end

And(/^I click on "([^"]*)"$/) do |button_text|
  @browser.button(text: button_text).click
end

Then(/^I see the puppy "([^"]*)" is in my litter$/) do |name|
  puppy_in_litter = @browser.h2(text: "#{name}:").exists?
  expect(puppy_in_litter).to eq true
end

Given(/^I have added a puppy to my litter$/) do
  step 'I am on the home page'
  step 'I click on the puppy "Brook"'
  step 'I click on "Adopt Me!"'
end