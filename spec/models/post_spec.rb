require 'spec_helper'

describe Post do

  before(:each) do
    @category = Category.new(:name => 'A Category')
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',:password => 'winteriscoming')
    @post = Post.new(:title => 'This is a post title',:content => 'This is some post content')
    @post.user = @user
    @post.category = @category
  end

  it 'should need a user ,a title and a category to be valid' do
    @post.should be_valid
  end

  it 'should not save if title is missing' do
    @post.title = nil
    @post.save.should be_false
  end

  it 'should not save if user is missing' do
    @post.user = nil
    @post.save.should be_false
  end

  it 'should not save if category is missing' do
    @post.category = nil
    @post.save.should be_false
  end

  it 'should allow access to the title and content' do
    @post.title.should eql 'This is a post title'
    @post.content.should eql 'This is some post content'
    @post.title = 'Edited title'
    @post.content = 'Edited content'
    @post.title.should eql 'Edited title'
    @post.content.should eql 'Edited content'
  end

  it 'should return a human readable string of it\' tags' do
    ['Some','tags','of','a,post'].each do |s|
      @post.tags << Tag.new(:name =>s )
    end
   @post.tag_string.should eql 'Some,tags,of,a,post'
  end

  it 'should allow access to any comments it is associated to it' do
    ['Some','comments'].each do |s|
      comment = Comment.new(:text => s)
      comment.user = @user
      @post.comments << comment
    end
    @post.comments.first.text.should eql 'Some'
    @post.comments.last.text.should eql 'comments'
  end

  after (:each) do
    @category.destroy
    @user.destroy
    @post.destroy
  end
end