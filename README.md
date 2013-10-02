ChannelBack

Team

Team Members :
Ankit Bhutani (abhutan@ncsu.edu)
Govind Menon (grmenon@ncsu.edu)
Nitish Pandey (npandey@ncsu.edu)

Basics

Available at http://channelback-mriya.herokuapp.com/

The super-admin is

Email: batman@gotham.com
Password: vengeance
Name: The Dark Knight

Please go to '/admin' to access admin functionality

To run rspec tests please use the following command

$ bundle exec rspec

To run cucumber tests please use the following command

$ bundle exec cucumber

To start the server locally

$ bundle exec rails s

Extra Functionality

Admin can edit/delete posts and comments

Admin can edit categories

Rspec for unit and integration tests

Cucumber running on Selenium for GUI/Functional testing

Haml for html templating

Heroku for deployment

Automated Testing

Unit Tests

Rspec tests test the models in isolation

Integration Tests

Rspec tests test the controllers and models in conjunction

Functional / GUI tests

Cucumber tests the entire app from a user perspective

Features Implemented ( taken from Project description)

Anyone can create an account by filling out a form that comes up on the homepage of the app.
Any user with an account can post. A category must be associated with each post; students can select from categories created by the administrator. Students are also welcome to create and use their own tags.
Anyone (account or not) can search by user or content or category or tag or user, by using the Search box on the homepage. Also, (s)he can see all posts associated with that category when (s)he searches by category. This way if the category is homework1 user can see all posts associated with homework1.

Any logged-in user can edit/delete their own post/comment.
Any logged-in user can “up vote” any post or comment.
The system maintains a count of votes for each post.

When the system displays a post or comment, next to the post or comment should be the number of votes.
You cannot vote up your own posts or comment.
You cannot vote up the same post or comment more than once.
Any logged-in user can reply to a post (but not to a reply; i.e., only to a depth of 1).
A user can also vote up a reply (by someone else).

The “most active” questions are displayed at the top. “Most active” is determined by the combined number of votes on the posts and comments on that post, as well as time elapsed.

The function is given in models/post.rb

-(post_votes_count + 0.5 * comment_votes_count + 0.1*(created_at - first_post_time)/36e6)


If a user logs in as an admin, (s)he sees a different interface from what non-admins see.

There should be a ‘super’ admin in system that his role of admin cannot be removed. There should be code to handle that this user cannot be deleted

Administrators can create other admin accounts.

An administrator can create admins in two ways

1. Create an Admin using a form
2. Promote an existing user to an admin

An administrator can delete his/her own account, but no one other admin’s.
Administrators can see the list of users with their credentials
Administrators can delete posts and users
View reports on post activity,including number of votes for each post such that it is possible to use this report to assign grades.
An administrator can create categories for posts.  .

