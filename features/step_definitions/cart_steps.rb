Then(/^the order total is "([^"]*)"$/) do |expected_total|
  cart_page = CartPage.new(@browser)
  expect(cart_page.total).to eq expected_total
end

Then(/^the error "([^"]*)" is displayed$/) do |expected_error|
  cart_page = CartPage.new(@browser)
  expect(cart_page.errors).to include expected_error
end