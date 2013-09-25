require 'spec_helper'

describe CommentVote do

  before(:each) do
    @category = Category.new(:name => 'A Category')
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',:password => 'winteriscoming')
    @post = Post.new(:title => 'This is a post title',:content => 'This is some post content')
    @comment = Comment.new(:text => 'This is a comment')
    @comment.post = @post
    @comment.user = @user
    @post.user = @user
    @post.category = @category
    @vote = CommentVote.new
    @vote.user = @user
    @vote.comment = @comment
  end

  it 'should be valid it is associated with a post and a user' do
    @vote.save.should be_true
  end

  it 'should not save if the user is missing' do
    @vote.user = nil
    @vote.save.should be_false
  end

  it 'should not save if the comment is missing' do
    @vote.comment = nil
    @vote.save.should be_false
  end

  it 'should show which post it was made upon' do
    @vote.save.should be_true
    @vote.comment.text.should eql 'This is a comment'
  end

  it 'should show which user it was made by' do
    @vote.save.should be_true
    @vote.user.name.should eql 'Ned'
  end

  it 'should come up as one of the comment\'s votes' do
    @vote.save.should be_true
    @comment.comment_votes.count.should eql 1
    @vote_1 = CommentVote.new
    @vote_1.user = User.new(:name => 'Kat',:email => 'kat@winterfell.com',:password => 'winteriscoming')
    @vote_1.comment = @comment
    @vote_1.save.should be_true
    @comment.comment_votes.count.should eql 2
  end
end