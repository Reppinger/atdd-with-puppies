Feature: As a user of the site
  I want to be able to contact the agency
  So that I can ask pertinent questions

  Background: Contact common setup
    Given I am on the home page
    When I click on the email icon

  Scenario: #1 Get to the contact form
    Then I see the heading "Contact"

  Scenario: #2 Submit a message
    When I fill the form in with the following values:
      | name        | email           | message                                            |
      | Joe Sixpack | joe@sixpack.com | I am having trouble adopting a puppy. Please help! |
    And I click on "Send"
    Then a contact confirmation is displayed

  Scenario Outline: #3 All fields are required to send a message to the agency
    When the contact form is completely filled in
    But I blank out "<element>"
    And I click on "Send"
    Then I see "<error>"

    Examples:
      | element               | error                |
      | contact_message_name  | Name can't be blank  |
      | contact_message_email | Email can't be blank |
      | contact_message_body  | Body can't be blank  |
