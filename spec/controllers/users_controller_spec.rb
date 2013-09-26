require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',
                     :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
    @user.save
  end

  it 'should show a login page if the user is not signed in' do
    get :sign_in
    response.code.should eql '200'
    response.should render_template(:sign_in)
  end

  it 'should redirect to posts if the user is already logged in' do
    session[:user_id] = @user.id
    get :sign_in
    response.code.should eql '302'
    response.should redirect_to '/posts'
  end


  it 'should set the session if the user is signed in correctly and redirec to posts' do
    post :login,:email => @user.email,:password => @user.password
    response.code.should eql '302'
    response.should redirect_to '/posts'
    session[:user_id].should eql @user.id
  end

  it 'should not set the session if the sign in failed and redirect back to the sign in page'  do
    post :login,:email => 'yabba',:password => 'dabba'
    response.code.should eql '302'
    response.should redirect_to '/users/sign_in'
    session[:user_id].should eql nil
  end

  after(:each) do
    @user.destroy
    session[:user_id] = nil
  end

end