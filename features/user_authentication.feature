Feature: User Authentication

  Scenario: User Signing Up, Signing In and Signing Out
    Given that I visit the sign in page
    And I click "First Time Here?"
    Then I should see "Sign Up Form"
    And on the user sign up form I fill in "name" with "Ned Stark"
    And on the user sign up form I fill in "email" with "ned@winterfell.com"
    And on the user sign up form I fill in "password" with "winteriscoming"
    And on the user sign up form I fill in "password_confirmation" with "winteriscoming"
    When I press "Sign Up!"
    Then the page should have the message "You may now login"
    And on the login page I fill in "email" with "ned@winterfell.com"
    And on the login page I fill in "password" with "winteriscoming"
    When I press "Log In"
    Then I should see the "posts" page
    When I click "Sign Out"
    Then the page should have the message "You have been logged out"
    Then I should see the "user_sign_in" page