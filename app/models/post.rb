class Post < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :title,:content
  belongs_to :user
  belongs_to :category
  has_many :tags
  has_many :comments
  accepts_nested_attributes_for :tags
  validates :title,:presence => true
  validates :category,:presence => true
  validates :user,:presence => true

  def tag_string
    return tags.collect{|t| t.name}.join(',')
  end
end