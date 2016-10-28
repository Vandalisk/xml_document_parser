class AddReferenceOrganizationToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :organizations, :purchase, index: true
  end
end
