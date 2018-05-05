class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :round, default: 0
      t.integer :phase, default: 0

      t.timestamps
    end
  end
end
