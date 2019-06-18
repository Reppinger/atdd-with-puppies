class PuppyDetailsPage

  def initialize(browser)
    @browser = browser
  end

  def adopt_me_displayed?
    @browser.html.include?('Adopt Me!')
  end
end