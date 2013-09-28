
Feature: Creating and Reading Posts

  Scenario: User Signing In, Creating a Post
    Given that I am a registered user
    And there are some existing categories
    And that I visit the sign in page
    And on the login page I fill in "email" with "ned@winterfell.com"
    And on the login page I fill in "password" with "winteriscoming"
    When I press "Log In"
    Then I should see the "posts" page
    And I click "New Post"
    And on the new post form I fill in "title" with "I am Lord Eddard Stark"
    And on the new post form I fill in "content" with "I am Warden of the North"
    And on the new post form I fill in "tags" with "stark,direwolf"
    And on the new post form I select "Westeros" from the "category" dropdown
    And I press "Create Post"
    Then I should see the "posts" page
    And I should see "I am Lord Eddard Stark"
    And I should see "by Ned Stark"
    And I click "Read"
    Then I should see the "I am Lord Eddard Stark" post

