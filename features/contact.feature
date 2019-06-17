Feature: As a user of the site
  I want to be able to contact the agency
  So that I can ask pertinent questions

  Scenario: #1 Get to the contact form
    Given I am on the home page
    When I click on the email icon
    Then I see the heading "Contact"

  Scenario: #2 Submit a message
    Given I am on the home page
    When I click on the email icon
#    And I fill the form in with the following values:
#      | element               | value                                              |
#      | contact_message_name  | Joe Sixpack                                        |
#      | contact_message_email | joe@sixpack.com                                    |
#      | contact_message_body  | I am having trouble adopting a puppy. Please help! |
    And I fill the form in with the following values:
      | contact_message_name | contact_message_email | contact_message_body                               |
      | Joe Sixpack          | joe@sixpack.com       | I am having trouble adopting a puppy. Please help! |
    And I click on "Send"
    Then I see "Thank you for contacting us!"

  Scenario Outline: #3 All fields are required to send a message to the agency
    Given I am on the home page
    When I click on the email icon
    And the contact form is completely filled in
    But I blank out "<element>"
    And I click on "Send"
    Then I see "<error>"

    Examples:
      | element               | error                |
      | contact_message_name  | Name can't be blank  |
      | contact_message_email | Email can't be blank |
      | contact_message_body  | Body can't be blank  |
