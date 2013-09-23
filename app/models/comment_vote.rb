class CommentVote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  validates_uniqueness_of :id, :scope => [:comments_id,:users_id]

  def self.find_vote(comment_id,user_id)
   CommentVote.where(:comments_id => comment_id,:users_id => user_id)
  end

end