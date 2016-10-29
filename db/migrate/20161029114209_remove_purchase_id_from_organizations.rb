class RemovePurchaseIdFromOrganizations < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :purchase_id
  end
end
