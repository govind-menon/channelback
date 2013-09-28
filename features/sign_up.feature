Feature: User Signing Up

  Scenario: User Signing Up and Signing in
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