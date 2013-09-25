require 'spec_helper'

describe PostVote do

  before(:each) do
    @category = Category.new(:name => 'A Category')
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',:password => 'winteriscoming')
    @post = Post.new(:title => 'This is a post title',:content => 'This is some post content')
    @post.user = @user
    @post.category = @category
    @vote = PostVote.new
    @vote.user = @user
    @vote.post = @post
  end

  it 'should be valid it is associated with a post and a user' do
    @vote.save.should be_true
  end

  it 'should not save if the user is missing' do
    @vote.user = nil
    @vote.save.should be_false
  end

  it 'should not save if the post is missing' do
    @vote.post = nil
    @vote.save.should be_false
  end

  it 'should show which post it was made upon' do
    @vote.save.should be_true
    @vote.post.title.should eql 'This is a post title'
  end

  it 'should show which user it was made by' do
    @vote.save.should be_true
    @vote.user.name.should eql 'Ned'
  end

  it 'should come up as one of the post\'s votes' do
    @vote.save.should be_true
    @post.post_votes.count.should eql 1
    @vote_1 = PostVote.new
    @vote_1.user = User.new(:name => 'Kat',:email => 'kat@winterfell.com',:password => 'winteriscoming')
    @vote_1.post = @post
    @vote_1.save.should be_true
    @post.post_votes.count.should eql 2
  end
end