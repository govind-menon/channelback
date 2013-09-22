class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :post
  belongs_to :user
  validates :text,:presence => true
end