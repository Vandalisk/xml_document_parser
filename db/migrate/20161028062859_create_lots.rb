class CreateLots < ActiveRecord::Migration[5.0]
  def change
    create_table :lots do |t|
      t.string :guid
      t.integer :ordinal_number
      t.string :subject
      t.integer :currency_id, index: true, foreign_key: true
      t.decimal :initial_sum, precision: 8, scale: 2
      t.string :delivery_place
      t.references :purchase, index: true, foreign_key: true

      t.timestamps
    end
  end
end
