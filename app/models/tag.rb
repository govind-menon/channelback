class Tag < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name
  belongs_to :post
  validates :name,:presence => true,:uniqueness => true
  validates :post,:presence => true
end