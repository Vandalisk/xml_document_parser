class AddPlacerToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :placer, index: true
  end
end
