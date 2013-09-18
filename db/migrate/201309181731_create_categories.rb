class CreateCategories < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  create_table :categories do |f|
    f.string :name
    f.timestamps
  end
end