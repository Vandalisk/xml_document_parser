class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone
      t.string :fax
      t.string :email
      t.references :organization, index: true, foreign_key: true

      t.timestamps
    end
  end
end
