class AddCommentsToUsersAndPosts < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :comments
    end
    change_table :posts do |t|
      t.references :comments
    end
  end
end