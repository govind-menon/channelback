require 'spec_helper'

describe CategoriesController do

  before(:each) do
    ['Category1','Category2','Category3'].each do |cat_name|
      Category.new(:name => cat_name).save
    end
    @admin = Admin.new(:name => 'Ned',:email => 'ned@winterfell.com',
                       :password => 'winteriscoming',:password_confirmation => 'winteriscoming')
    @admin.save
    session[:admin_id] = @admin.id
  end

  it 'should return the list of existing categories to a logged in admin' do
    get :index
    response.code.should eql '200'
    expect(response).to render_template(:index)
  end

  it 'should display a form for creating a new category' do
    get :new
    response.code.should eql '200'
    expect(response).to render_template(:new)
  end

  it 'should create a new category and redirect to the list of categories' do
    post :create, :category => {:name => 'Cat'}
    response.code.should eql '302'
    response.should redirect_to '/categories'
  end

  it 'should not create a new category and redirect to the form if there is an error' do
    post :create, :category => {:name => 'Category1'}
    response.code.should eql '302'
    response.should redirect_to '/categories/new'
  end

  it 'should edit an existing category and redirect to the list of categories' do
    put :update,:id => Category.find_by_name('Category1'), :category => {:name => 'Cat'}
    response.code.should eql '302'
    response.should redirect_to '/categories'
    put :update,:id => Category.find_by_name('Cat'), :category => {:name => 'Category1'}
  end

  it 'should not edit an existing category and redirect to the form if there is an error' do
    put :update,:id => Category.find_by_name('Category1'), :category => {:name => 'Category2'}
    response.code.should eql '302'
    response.should redirect_to '/categories/' + Category.find_by_name('Category1').id.to_s + '/edit'
  end


  after(:each) do
    ['Category1','Category2','Category3'].each do |cat_name|
      Category.find_by_name(cat_name).destroy
    end
  end

end