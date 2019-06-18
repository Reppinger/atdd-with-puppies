class CartPage
  def initialize(browser)
    @browser = browser
  end

  def total
    @browser.td(class: 'total_cell').text
  end
end