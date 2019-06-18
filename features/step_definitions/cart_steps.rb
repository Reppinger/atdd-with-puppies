Then(/^the order total is "([^"]*)"$/) do |expected_total|
  cart_page = CartPage.new(@browser)
  expect(cart_page.total).to eq expected_total
end