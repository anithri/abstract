class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :theme
      t.integer :worker_ids, array: true, default: []
      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end
