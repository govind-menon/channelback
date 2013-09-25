class AddPasswordConfirmationToAdmin < ActiveRecord::Migration
  def change
    change_table :admins do |t|
      t.text :password_confirmation
    end
  end
end