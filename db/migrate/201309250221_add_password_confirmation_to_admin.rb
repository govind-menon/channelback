class AddPasswordConfirmationToAdmin < ActiveRecord::Migration
  def change
    change_table :admins do |t|
      t.text :password_confirmation
    end
    user = Admin.find_by_email('batman')
    user.password_confirmation = user.password
    user.save
  end
end