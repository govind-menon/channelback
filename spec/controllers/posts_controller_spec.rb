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

  it 'should create a new post and redirect to the list of posts' do
    post :create,:post => {:title => 'This is a new post title',:content => 'This is some more content',:category_id=> Category.find_by_name('Category1').id,:tags => ''}
    response.code.should eql '302'
    response.should redirect_to '/posts'
  end

  it 'should not create a new post and redirect to the post form if there is an error' do
    post :create,:post => {:content => 'This is some more content',:category_id=> Category.find_by_name('Category1').id,:tags => ''}
    response.code.should eql '302'
    response.should redirect_to '/posts/new'
  end

  it 'should edit an existing post and redirect to the list of posts' do
    put :update,:id => Post.find_by_title('This is a post title').id, :post => {:title => 'This is an edited post title',
                                                                                :content => 'This is some more content',
                                                                                :category_id=> Category.find_by_name('Category1').id,:tags => ''}
    response.code.should eql '302'
    response.should redirect_to '/posts'
  end

  it 'should not edit an existing post and redirect back to the form' do
    put :update,:id => Post.find_by_title('This is a post title').id, :post => {:title => '',
                                                                                :content => 'This is some more content',
                                                                                :category_id=> Category.find_by_name('Category1').id,:tags => ''}
    response.code.should eql '302'
    response.should redirect_to '/posts/' + Post.find_by_title('This is a post title').id.to_s + '/edit'
  end

  it 'should redirect to sign in path if user not signed in when editing' do
    session[:user_id] = nil
    get :edit,:id => Post.find_by_title('This is a post title').id
    response.code.should eql '302'
    response.should redirect_to '/users/sign_in'
  end

  it 'should not edit an existing post and redirect to sign in path if the user is not signed in' do
    session[:user_id] = nil
    put :update,:id => Post.find_by_title('This is a post title').id, :post => {:title => 'This is an edited post title',
                                                                                :content => 'This is some more content',
                                                                                :category_id=> Category.find_by_name('Category1').id,:tags => ''}
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