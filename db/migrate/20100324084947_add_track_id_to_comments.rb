class AddTrackIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :track_id, :integer
    add_index :comments, :track_id
  end

  def self.down
    remove_index :comments, :track_id
    remove_column :comments, :track_id
  end
end
