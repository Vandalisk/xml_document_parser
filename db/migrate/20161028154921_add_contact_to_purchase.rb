class AddContactToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :contact, index: true
  end
end
