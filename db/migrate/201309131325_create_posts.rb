class CreatePosts < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    create_table :posts do |f|
      f.string :title
      f.text :content
      f.timestamps
      f.belongs_to :user
    end
  end
end