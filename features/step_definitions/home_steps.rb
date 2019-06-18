Given(/^I am on the home page$/) do
  @browser.goto('http://localhost:3000')
end

Then(/^I see the home page$/) do
  expect(@browser.html.include?('Puppy List')).to eq true
end