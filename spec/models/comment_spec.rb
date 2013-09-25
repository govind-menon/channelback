require 'spec_helper'

describe Comment do

  before(:each) do
    @category = Category.new(:name => 'A Category')
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',:password => 'winteriscoming',:password_confirmation => 'winteriscoming')
    @post = Post.new(:title => 'This is a post title',:content => 'This is some post content')
    @post.user = @user
    @post.category = @category
    @comment = Comment.new(:text => 'This is a comment')
    @post.save
    @user.save
    @comment.user = @user
    @comment.post = @post
  end

  it 'should save a comment with text and if it is associated with a valid user and a post' do
    @comment.save.should be_true
  end

  it 'should not save a comment without a user' do
    @comment.user = nil
    @comment.save.should be_false
  end

  it 'should not save a comment without a post'  do
    @comment.post = nil
    @comment.save.should be_false
  end

  it 'should not save a comment without text' do
    @comment.text = ''
    @comment.save.should be_false
  end

  it 'should be able to find the user who created it' do
    @comment.save.should be_true
    User.find(@comment.user.id).name.should eql 'Ned'
  end

  it 'should be able to find the post the comment was made on' do
    @comment.save.should be_true
    Post.find(@comment.post_id).title.should eql 'This is a post title'
  end

  after (:each) do
    @category.destroy
    @user.destroy
    @post.destroy
    @comment.destroy
  end

end