class ChangeColumnsOnPurchases < ActiveRecord::Migration[5.0]
  def up
    remove_column :purchases, :contact
    remove_column :purchases, :documentation_delivery
    remove_column :purchases, :nonelectronic_place_info
    remove_column :purchases, :customer_id
    remove_column :purchases, :placer_id
  end

  def down
    add_column :purchases, :contact, :integer, index: true, foreign_key: true
    add_column :purchases, :documentation_delivery, :integer, index: true, foreign_key: true
    add_column :purchases, :nonelectronic_place_info, :integer, index: true, foreign_key: true
  end
end
