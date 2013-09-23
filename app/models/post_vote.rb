class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :id, :scope => [:posts_id,:users_id]

  def self.find_vote(post_id,user_id)
   PostVote.where(:posts_id => post_id,:users_id => user_id)
  end

end