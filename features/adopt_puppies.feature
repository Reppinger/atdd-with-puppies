Feature: As a dog lover
  I want to adopt a puppy
  So that I have a loyal companion

  Scenario: #1 Be able to view the details of a puppy
    Given I am on the home page
    When I click on the puppy "Brook"
    Then the puppy can be adopted

  Scenario: #2 Be able to return to the view of all available puppies
    Given I am on the home page
    When I click on the puppy "Brook"
    And I click on "Return to List"
    Then I see the home page

  Scenario: #3 Be able to add the puppy to adopt later
    Given I am on the home page
    When I click on the puppy "Brook"
    And I click on "Adopt Me!"
    Then I see the puppy "Brook" is in my litter

  Scenario: #4 Be able to change my mind about adopting a puppy
    Given I have added a puppy to my litter
    When I click on "Change Your Mind"
    Then I see the home page

  Scenario: #5 Be able to add another puppy to my litter
    Given I have added a puppy to my litter
    When I click on "Adopt Another Puppy"
    And I click on the puppy "Ruby Sue"
    And I click on "Adopt Me!"
    Then I see the puppy "Ruby Sue" is in my litter

  Scenario: #6 Be able to change my mind removes all puppies from my litter
    Given I have added a puppy to my litter
    And I click on "Adopt Another Puppy"
    And I click on the puppy "Ruby Sue"
    And I click on "Adopt Me!"
    When I click on "Change Your Mind"
    Then I see the home page
    And I see "Your cart is currently empty"

#  @not_ready
  Scenario: #7 Add accessories to a puppy and the price change is reflected
    Given I have added a puppy to my litter
    When I add a Collar & Leash to my order
    And I add a Chew Toy to my order
    Then I see "$63.93"

  Scenario: #8 Complete an adoption
    Given I have added a puppy to my litter
    When I click on "Complete the Adoption"
    And I fill the order form in with the following values:
      | name        | address      | email           | pay_type |
      | Joe Sixpack | 123 Main St. | joe@sixpack.com | Check    |
    And I click on "Place Order"
    Then I see "Thank you for adopting a puppy!"

  Scenario Outline: #9 All fields are required to complete an adoption
    Given I have added a puppy to my litter
    When I click on "Complete the Adoption"
    And the order form is completely filled in
    But I blank out "<element>"
    And I click on "Place Order"
    Then I see "<error>"

    Examples:
      | element        | error                   |
      | order_name     | Name can't be blank     |
      | order_address  | Address can't be blank  |
      | order_email    | Email can't be blank    |
      | order_pay_type | Pay type can't be blank |
