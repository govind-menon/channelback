class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :id, :scope => [:post_id,:user_id]
  validates :post,:presence => true
  validates :user,:presence => true

  def self.find_vote(post_id,user_id)
   PostVote.where(:post_id => post_id,:user_id => user_id)
  end

end