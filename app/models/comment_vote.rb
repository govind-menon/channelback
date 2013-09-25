class CommentVote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  validates_uniqueness_of :id, :scope => [:comment_id,:user_id]
  validates :comment,:presence => true
  validates :user,:presence => true

  def self.find_vote(comment_id,user_id)
   CommentVote.where(:comment_id => comment_id,:user_id => user_id)
  end

end