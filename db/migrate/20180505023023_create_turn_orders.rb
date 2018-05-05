class CreateTurnOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :turn_orders do |t|
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true
      t.integer :order
      t.boolean :current

      t.timestamps
    end
  end
end
