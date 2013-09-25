class CreateAdmins < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    create_table :admins do |f|
      f.string :name
      f.string :email
      f.string :password
      f.timestamps
    end
    Admin.create(:name => 'The Dark Knight',:email => 'batman@gotham.com',:password => 'vengeance',:password_confirmation => 'vengeance')
  end
end