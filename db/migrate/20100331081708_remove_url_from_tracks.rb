class RemoveUrlFromTracks < ActiveRecord::Migration
  def self.up
    remove_column :tracks, :url
  end

  def self.down
    add_colums :tracks, :url, :string
  end
end
