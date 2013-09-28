
Given(/^that I am a registered admin$/) do
  @admin = Admin.new(:name => 'Tyrion Lannister',:email => 'tyrion@casterlyrock.com',:password => 'wearitlikearmour',:password_confirmation => 'wearitlikearmour')
  @admin.save.should be_true
end

When(/^I visit the admin sign in page$/) do
  visit admin_sign_in_path
end

When(/^on the admin sign in page I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1,with: arg2
end

Then(/^I should see the list of admins$/) do
  current_path.should eql admins_path
  page.should have_content 'Tyrion Lannister'
end

Then(/^I should see the list of categories$/) do
  current_path.should eql categories_path
end

When(/^on the new category form I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in 'category_' + arg1,with: arg2
end
