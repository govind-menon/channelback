class Post < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :title,:content
  belongs_to :user
  belongs_to :category
  validates :title,:presence => true
  validates :category,:presence => true
end