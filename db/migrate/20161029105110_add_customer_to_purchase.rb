class AddCustomerToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :customer, index: true
  end
end
