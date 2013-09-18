class Category < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name
  validates :name,:presence => true,:uniqueness => true
  has_many :posts
end