Feature: As a user of the site
  I want to be able to have online discussions
  So that I can learn from other dog enthusiasts

  Background:
    Given I am on the home page
    And I visit the Message Boards

  Scenario: #1 Can access the Message Boards
    Then I see the heading "Message Boards"

  @data_purge
  Scenario: #2 Create a new topic thread
    When I post the message:
      | nickname      | body                  |
      | goldeneye1942 | Goldens are the best! |
    And I click on "Post"
    Then the post with "Goldens are the best!" is displayed

  @data_purge
  Scenario: #3 Create a reply to a thread
    Given I have an existing thread
    When I click on "Reply"
    And I fill the form in with the following values:
      | element                  | value                         |
      | discussion_post_nickname | poochtroop32                  |
      | discussion_post_body     | +1 They are so mild mannered. |
    And I click on "Post"
    Then I see a post with the message "+1 They are so mild mannered."

