require 'spec_helper'

describe User do

  before(:each) do
    @user = User.new(:name => 'Ned',:email => 'ned@winterfell.com',
                     :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
  end

  it 'should be valid if it has a name,email,password and password confirmation' do
    @user.save.should be_true
  end

  it 'should only save if the password and password confirmation match' do
    @user.password_confirmation = 'hearmeroar'
    @user.save.should be_false
  end

  it 'should not save if the email is missing or not a valid email' do
    @user.email = nil
    @user.save.should be_false
    @user.email = 'alannisteralwayspayshisdebts'
    @user.save.should be_false
  end

  it 'should not save if a user with the same email already exists' do
    @user.save.should be_true
    @user_2 = User.new(:name => 'Robb',:email => 'ned@winterfell.com',
                     :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
    @user_2.save.should be_false
  end

  it 'should return the user if the email and password match' do
    @user.save.should be_true
    @user.id.should eql User.authenticate('ned@winterfell.com','winteriscoming').id
  end

  it 'should return nil if the email and password do not match' do
    @user.save.should be_true
    User.authenticate('ned@winterfell.com','familydutyhonor').should eql nil
  end

  it 'should return nil if the email is not found' do
    @user.save.should be_true
    User.authenticate('kat@winterfell.com','winteriscoming').should eql nil
  end

  after(:each) do
    @user.destroy
  end
end