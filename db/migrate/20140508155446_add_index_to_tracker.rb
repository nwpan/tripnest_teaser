class AddIndexToTracker < ActiveRecord::Migration
  def change
    add_index :trackers, :ip_address, unique: true
  end
end
