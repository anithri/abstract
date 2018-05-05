class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.references :game, foreign_key: true
      t.integer :board_id
      t.integer :card_ids, array: true, default: []

      t.timestamps
    end
  end
end
