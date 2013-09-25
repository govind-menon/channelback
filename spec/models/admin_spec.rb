require 'spec_helper'

describe Admin do

  before(:each) do
    @admin = Admin.new(:name => 'Ned',:email => 'ned@winterfell.com',
                     :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
  end

  it 'should be valid if it has a name,email,password and password confirmation' do
    @admin.save.should be_true
  end

  it 'should only save if the password and password confirmation match' do
    @admin.password_confirmation = 'hearmeroar'
    @admin.save.should be_false
  end

  it 'should not save if the email is missing or not a valid email' do
    @admin.email = nil
    @admin.save.should be_false
    @admin.email = 'alannisteralwayspayshisdebts'
    @admin.save.should be_false
  end

  it 'should not save if a Admin with the same email already exists' do
    @admin.save.should be_true
    @admin_2 = Admin.new(:name => 'Robb',:email => 'ned@winterfell.com',
                       :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
    @admin_2.save.should be_false
  end

  it 'should return the Admin if the email and password match' do
    @admin.save.should be_true
    @admin.id.should eql Admin.authenticate('ned@winterfell.com','winteriscoming').id
  end

  it 'should return nil if the email and password do not match' do
    @admin.save.should be_true
    Admin.authenticate('ned@winterfell.com','familydutyhonor').should eql nil
  end

  it 'should return nil if the email is not found' do
    @admin.save.should be_true
    Admin.authenticate('kat@winterfell.com','winteriscoming').should eql nil
  end

  after(:each) do
    @admin.destroy
  end
end