require 'spec_helper'

describe Category do
  it 'should be able to create new category if all necessary values are present' do
    category = Category.new(:name => 'someCategory')
    category.should be_valid
    category.destroy

  end

  it 'should not create category if name not present' do
    category = Category.new
    category.should_not be_valid
    category.destroy
  end

  it 'should not create category with duplicate name' do
    category_1 = Category.new(:name => 'someCategory')
    category_2 = Category.new(:name => 'someCategory')
    category_1.save.should be_true
    category_2.save.should_not be_true
    category_1.destroy
  end

  it 'should be able to get and set the category name' do
    category = Category.new(:name => 'something')
    category.name.should  eql 'something'
    category.name = 'somethingElse'
    category.name.should  eql 'somethingElse'
    category.destroy
  end
end