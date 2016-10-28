class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :guid
      t.datetime :create_date_time
      t.string :file_name
      t.text :description
      t.string :url
      t.references :purchase, index: true, foreign_key: true

      t.timestamps
    end
  end
end
