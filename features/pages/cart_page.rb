class CartPage
  def initialize(browser)
    @browser = browser
  end

  def total
    @browser.td(class: 'total_cell').text
  end

  def errors
    @browser.div(id: 'error_explanation').ul.text
  end
end