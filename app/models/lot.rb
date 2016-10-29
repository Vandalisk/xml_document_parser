# == Schema Information
#
# Table name: lots
#
#  id             :integer          not null, primary key
#  guid           :string
#  ordinal_number :integer
#  subject        :string
#  currency_id    :integer
#  initial_sum    :decimal(8, 2)
#  delivery_place :string
#  purchase_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Lot < ApplicationRecord
  ASSOCIATED_MODELS = {
    currency: { class: 'Currency', type: 'belongs_to', nested_key: 'currency_attributes' },
    lotItems: { class: 'LotItem', type: 'has_many', item_key: 'lotItem', nested_key: 'lot_items_attributes' }
  }
  NOT_INCLUDE = %w(id currency_id purchase_id created_at updated_at)

  belongs_to :currency
  has_many :lot_items

  accepts_nested_attributes_for :currency, :lot_items
end
