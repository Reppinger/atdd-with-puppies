class PuppyDetailsPage

  def initialize(browser)
    @browser = browser
  end

  def adopt_me_displayed?
    @browser.button(text: 'Adopt Me!').enabled?
  end
end