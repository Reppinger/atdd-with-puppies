class ContactPage
  def initialize(browser)
    @browser = browser
  end

  def heading_displayed?(expected_heading)
    @browser.html.include?(expected_heading)
  end

  def fill_form(contact)
    @browser.text_field(id: 'contact_message_name').set(contact['name'])
    @browser.text_field(id: 'contact_message_email').set(contact['email'])
    @browser.textarea(id: 'contact_message_body').set(contact['message'])
  end

end
