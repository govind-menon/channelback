class AddVotesToPosts < ActiveRecord::Migration
  change_table :posts do |t|
    t.references :post_votes
  end
end