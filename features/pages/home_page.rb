class HomePage
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto 'http://localhost:3000'
  end

  def view_puppy_details(name)
    @browser.div(text: name).parent.button(text: 'View Details').click
  end

  def empty_cart?
    @browser.p(id: 'notice').text == 'Your cart is currently empty'
  end
end