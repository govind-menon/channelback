class AddTagsToPosts < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    change_table :posts do |f|
      f.references :tags
    end
  end
end