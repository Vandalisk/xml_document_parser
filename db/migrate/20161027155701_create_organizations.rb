class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :full_name
      t.string :short_name
      t.string :inn
      t.string :kpp
      t.string :ogrn
      t.string :legal_address
      t.string :postal_address
      t.string :phone
      t.string :email
      t.string :okato

      t.timestamps
    end
  end
end
