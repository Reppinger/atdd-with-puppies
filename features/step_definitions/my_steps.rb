Given(/^I am on the home page$/) do
  @browser.goto 'http://localhost:3000'
end


When(/^I click on the puppy "([^"]*)"$/) do |name|
  @browser.div(text: name).parent.button.click
end

Then(/^I see "([^"]*)"$/) do |expected_text|
  expect(@browser.html.include?(expected_text)).to eq true
end