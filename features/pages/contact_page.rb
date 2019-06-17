class ContactPage
  def initialize(browser)
    @browser = browser
  end

  def heading_displayed?(expected_heading)
    @browser.html.include?(expected_heading)
  end
end
