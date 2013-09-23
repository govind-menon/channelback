class AddVotesToPosts < ActiveRecord::Migration
  change_table :posts do |t|
    t.references :votes
  end
end