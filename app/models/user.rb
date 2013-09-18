class User < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name,:email,:handle,:password

  validates :email, :uniqueness => :true
  validates :email,:presence => true

  has_many :posts

  def self.authenticate(email,password)
    @user = User.find_by_email(email)
    if not @user.nil? and @user.password.eql? password
      return @user
    else
      nil
    end
  end

end