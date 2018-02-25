class AddCachedLikesToPosts < ActiveRecord::Migration[5.1]
  def self.up

      add_column :articles , :cached_votes_total,:integer, default: 0
      add_column :articles , :cached_votes_score,:integer, default: 0
      add_column :articles , :cached_votes_up,:integer, default: 0
      add_column :articles , :cached_votes_down,:integer, default: 0
      add_column :articles , :cached_weighted_score,:integer, default: 0
      add_column :articles , :cached_weighted_total,:integer, default: 0
      add_column :articles , :cached_weighted_average,:float, default: 0.0
      add_index :articles , :cached_votes_total, default: 0
      add_index :articles , :cached_votes_score, default: 0
      add_index :articles , :cached_votes_up, default: 0
      add_index :articles , :cached_votes_down, default: 0
      add_index :articles , :cached_weighted_score, default: 0
      add_index :articles , :cached_weighted_total, default: 0
      add_index :articles , :cached_weighted_average, default: 0.0
  end
  def self.down
    remove_column :articles , :cached_votes_total
    remove_column :articles , :cached_votes_score
    remove_column :articles , :cached_votes_up
    remove_column :articles , :cached_votes_down
    remove_column :articles , :cached_weighted_score
    remove_column :articles , :cached_weighted_total
    remove_column :articles , :cached_weighted_average

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end
end
