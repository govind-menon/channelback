class Post < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :title,:content
  belongs_to :user
  belongs_to :category
  has_many :tags
  accepts_nested_attributes_for :tags
  validates :title,:presence => true
  validates :category,:presence => true

  def tag_string
    return tags.collect{|t| t.name}.join(',')
  end
end