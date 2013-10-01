Feature: Admin

  Scenario: Admin Signs In and Creates a Category
    Given that I am a registered admin
    When I visit the admin sign in page
    And on the admin sign in page I fill in "email" with "tyrion@casterlyrock.com"
    And on the admin sign in page I fill in "password" with "wearitlikearmour"
    And I press "Log In"
    Then I should see the list of admins
    And I click "Manage Categories"
    Then I should see the list of categories
    When I click "New Category"
    And on the new category form I fill in "name" with "Broken Things"
    And I press "Create Category"
    Then I should see the list of categories
    And I should see "Broken Things"

