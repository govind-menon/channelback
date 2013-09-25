class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :post
  belongs_to :user

  validates :text,:presence => true
  validates :post,:presence => true
  validates :user,:presence => true

  has_many :comment_votes

end