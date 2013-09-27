class User < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name,:email,:handle,:password,:password_confirmation

  validates :email, :uniqueness => :true
  validates :email,:presence => true
  validate :check_password_confirmation
  validates :email,format: {with: /[a-zA-z\._]*@[a-zA-z\._]*\.com/}

  has_many :posts

  def self.authenticate(email,password)
    @user = User.find_by_email(email)
    if not @user.nil? and @user.password.eql? password
      return @user
    else
      nil
    end
  end

  def check_password_confirmation
    errors.add(:password,'Password doesn\'t match password confirmation') if not password.eql? password_confirmation
  end

  def is_admin?
    not Admin.find_by_email(email).nil?
  end

end