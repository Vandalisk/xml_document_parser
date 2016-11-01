class CreateExports < ActiveRecord::Migration[5.0]
  def change
    create_table :exports do |t|
      t.string :purchase_number
      t.datetime :doc_publish_date
      t.string :href
      t.timestamps
    end
  end
end
