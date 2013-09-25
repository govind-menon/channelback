require 'spec_helper'

describe Tag do

  before(:each) do
    @category = Category.new(:name => 'A Category')
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',:password => 'winteriscoming')
    @post = Post.new(:title => 'This is a post title',:content => 'This is some post content')
    @post.user = @user
    @post.category = @category
    @category.save
    @user.save
    @post.save
    @tag = Tag.new(:name => 'Tag')
    @tag.post = @post
  end

  it 'should save it has a name and it\'s attached to a post' do
    @tag.save.should be_true
  end

  it 'should not save if it has no text' do
    @tag.name = ''
    @tag.save.should be_false
  end

  it 'should not save it it has no post' do
    @tag.post = nil
    @tag.save.should be_false
  end

  it 'should be able to find which post it has been tagged to' do
    @tag.save
    Tag.find(@tag.id).post.title.should eql 'This is a post title'
  end
  it 'should not save if a tag with the same name already exists' do
    @tag.save
    @dup_tag = Tag.new(:name => @tag.name)
    @dup_tag.post = @post
    @dup_tag.save.should be_false
  end

  after(:each) do
    @tag.destroy
    @post.destroy
    @user.destroy
    @category.destroy
  end

end