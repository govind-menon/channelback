
Given(/^that I visit the sign in page$/) do
  visit sign_in_path
end

And(/^I click "(.*?)"$/) do |arg1|
  page.should have_text(arg1)
  click_link(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_text(arg1)
end

And(/^on the user sign up form I fill in "(.*?)" with "(.*)?"$/) do |arg1,arg2|
  fill_in 'user_'+arg1, :with => arg2
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^the page should have the message "(.*?)"$/) do |arg1|
  page.should have_text(arg1)
end

And(/^on the login page I fill in "(.*?)" with "(.*)?"$/) do |arg1,arg2|
  fill_in arg1, :with => arg2
end

Then(/^I should see the "(.*?)" page$/) do |arg1|
  current_path.should == path_of(arg1)
end