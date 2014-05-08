class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :ip_address
      t.integer :count

      t.timestamps
    end
  end
end
