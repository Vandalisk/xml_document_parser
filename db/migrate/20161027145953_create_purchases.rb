class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.string :guid
      t.datetime :create_date_time
      t.column :registration_number, :bigint
      t.string :name
      t.integer :customer_id, index: true, foreign_key: true
      t.integer :purchase_method_code
      t.string :purchase_code_name
      t.integer :placer_id, index: true, foreign_key: true
      t.integer :contact, index: true, foreign_key: true
      t.datetime :publication_date_time
      t.datetime :modification_date
      t.integer :documentationDelivery, index: true, foreign_key: true
      t.string :status
      t.integer :version
      t.integer :save_user_id
      t.integer :nonelectronic_place_info
      t.text :examination_place
      t.datetime :examination_date_time
      t.datetime :submission_close_date_time
      t.datetime :publication_planned_date

      t.timestamps
    end
  end
end
