class AddVotesToComments < ActiveRecord::Migration
  change_table :comments do |t|
    t.references :comment_votes
  end
end