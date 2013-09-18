class AddCategoriesToPosts < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    change_table :posts do |f|
      f.belongs_to :category
    end
  end
end