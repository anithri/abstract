class CreateBags < ActiveRecord::Migration[5.2]
  def change
    create_table :bags do |t|
      t.integer :worker_ids, array: true, default: []
      t.integer :bucket_id
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
