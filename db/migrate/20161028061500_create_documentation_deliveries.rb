class CreateDocumentationDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :documentation_deliveries do |t|
      t.datetime :delivery_start_date_time
      t.datetime :delivery_end_date_time
      t.string :place
      t.text :procedure
      t.references :purchase, index: true, foreign_key: true

      t.timestamps
    end
  end
end
