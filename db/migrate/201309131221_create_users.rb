class CreateUsers < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    create_table :users do |f|
      f.string :name
      f.string :email
      f.string :password
      f.string :handle
    end
  end
end