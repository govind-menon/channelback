require 'spec_helper'

describe PostsController do

  before(:each) do
    ['Category1','Category2'].each do |cat_name|
      Category.new(:name => cat_name).save
    end
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',
                       :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
    @user.save
    @post = Post.new(:title => 'This is a post title',:content => 'This is some post content')
    @post.user = @user
    @post.category = Category.find_by_name('Category1')
    @post.save
    session[:user_id] = @user.id
  end

  it 'should show the list of posts' do
    get :index
    response.code.should eql '200'
    expect(response).to render_template(:index)
  end

  it 'should display a form for creating a new category if a user is logged in' do
    get :new
    response.code.should eql '200'
    expect(response).to render_template(:new)
  end

  it 'should redirect to sign in path if user not signed in' do
    session[:user_id] = nil
    get :new
    response.code.should eql '302'
    response.should redirect_to '/users/sign_in'
  end

  after(:each) do
    ['Category1','Category2'].each do |cat_name|
      Category.find_by_name(cat_name).destroy
    end
    @post.destroy
    @user.destroy
  end

end