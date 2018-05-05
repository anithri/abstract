class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :round, default: 0
      t.integer :phase, default: 0
      t.integer :player_ids, array: true, default: []
      t.timestamps
    end
  end
end
