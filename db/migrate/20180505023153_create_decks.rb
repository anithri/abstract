class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.references :game, foreign_key: true
      t.integer :card_id
      t.integer :order
      t.integer :board_id

      t.timestamps
    end
  end
end
