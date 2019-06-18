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
    notice_text == 'Your cart is currently empty'
  end

  def order_confirmed?
    notice_text == 'Thank you for adopting a puppy!'
  end

  private

  def notice_text
    @browser.p(id: 'notice').text
  end
end