When(/^I add a Collar & Leash to my order$/) do
  @browser.checkbox(id: 'collar').set
end

And(/^I add a Chew Toy to my order$/) do
  @browser.checkbox(id: 'toy').set
end

#only accepts one row
And(/^I fill the form in with the following values:$/) do |order_table|
  order = order_table.hashes.first
  #put name in name field
  @browser.text_field(id: 'order_name').set(order['name'])
  @browser.textarea(id: 'order_address').set(order['address'])
  @browser.text_field(id: 'order_email').set(order['email'])
  @browser.select(id: 'order_pay_type').select(order['pay_type'])
end
