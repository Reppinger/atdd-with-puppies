class ContactPage
  def initialize(browser)
    @browser = browser
  end

  def heading_displayed?(expected_heading)
    @browser.html.include?(expected_heading)
  end

  def fill_form(name, email, message)
    @browser.text_field(id: 'contact_message_name').set(name)
    @browser.text_field(id: 'contact_message_email').set(email)
    @browser.textarea(id: 'contact_message_body').set(message)
  end

end
