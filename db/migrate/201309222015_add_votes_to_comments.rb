class AddVotesToComments < ActiveRecord::Migration
  change_table :comments do |t|
    t.references :votes
  end
end