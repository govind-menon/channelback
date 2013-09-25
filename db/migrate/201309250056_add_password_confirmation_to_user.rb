class AddPasswordConfirmationToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :password_confirmation
    end
  end
end