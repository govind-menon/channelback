class Post < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :title,:content
  belongs_to :user
  validates :title,:presence => true
end