class Post < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :title,:content
  belongs_to :user
  belongs_to :category
  has_many :tags
  has_many :comments
  has_many :post_votes
  accepts_nested_attributes_for :tags
  validates :title,:presence => true
  validates :category,:presence => true
  validates :user,:presence => true

  def tag_string
    return tags.collect{|t| t.name}.join(',')
  end

  def active_score
    post_votes_count = post_votes.count
    comment_votes_count = comments.map {|v| v.comment_votes.count }.inject(0) {|p,v| p + v}
    first_post_time = Post.all.sort {|p,q| p.created_at <=> q.created_at}.first.created_at
    -(post_votes_count + 0.5 * comment_votes_count + 0.1*(created_at - first_post_time)/36e6)
  end

  def printed_user_name
    if user.nil?
      'Anonymous'
    else
      user.name
    end
  end

end