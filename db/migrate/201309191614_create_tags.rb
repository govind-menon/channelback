class CreateTags < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  create_table :tags do |f|
    f.string :name
    f.belongs_to :post
  end
end