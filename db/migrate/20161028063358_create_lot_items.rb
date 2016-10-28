class CreateLotItems < ActiveRecord::Migration[5.0]
  def change
    create_table :lot_items do |t|
      t.string :guid
      t.integer :ordinal_number
      t.integer :okdp_id, index: true, foreign_key: true
      t.integer :okved_id, index: true, foreign_key: true
      t.integer :okei_id, index: true, foreign_key: true
      t.column :qty, :bigint

      t.timestamps
    end
  end
end
