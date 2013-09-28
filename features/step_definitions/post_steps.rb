
Given(/^that I am a registered user$/) do
  @user = User.new(:name => 'Ned Stark',:email => 'ned@winterfell.com',:password => 'winteriscoming',:password_confirmation => 'winteriscoming')
  @user.save.should be_true
end

And(/^on the new post form I fill in "(.*?)" with "(.*)?"$/) do |arg1,arg2|
  fill_in 'post_'+arg1, :with => arg2
end

And(/^on the new post form I select "(.*?)" from the "(.*)?" dropdown$/) do |arg1,arg2|
  page.select(arg1,:from => 'post_' + arg2 + '_id')
end


And(/^there are some existing categories$/) do
  @category = Category.new(:name => 'Westeros')
  @category.save.should be_true
  @category = Category.new(:name => 'Asshai')
  @category.save.should be_true
end

Then(/^I should see the "(.*?)" post$/) do |arg1|
  @post = Post.find_by_title(arg1)
  current_path.should eql post_path(@post)
  page.should have_content(@post.title)
  page.should have_content(@post.content)
  page.should have_content(@post.tag_string)
end