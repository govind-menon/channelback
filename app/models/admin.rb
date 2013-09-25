class Admin < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :name,:email,:password,:password_confirmation
  validates :name,:presence => true
  validates :email,:presence => true
  validates :password,:presence => true
  validates :password,:confirmation => true
  validates :email,:uniqueness => true
  validates :email,:format => {with: /[a-zA-z\._]*@[a-zA-z\._]*\.com/}

  def self.authenticate(email,password)
    admin = Admin.find_by_email(email)
    if not admin.nil? and admin.password.eql? password
      return admin
    else
      nil
    end
  end

end
