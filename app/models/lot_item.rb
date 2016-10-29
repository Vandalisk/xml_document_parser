# == Schema Information
#
# Table name: lot_items
#
#  id             :integer          not null, primary key
#  guid           :string
#  ordinal_number :integer
#  okdp_id        :integer
#  okved_id       :integer
#  okei_id        :integer
#  lot_id         :integer
#  qty            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LotItem < ApplicationRecord
  ASSOCIATED_MODELS = {
    okdp: { class: 'Ok', type: 'belongs_to', nested_key: 'okdp_attributes' },
    okved: { class: 'Ok', type: 'belongs_to', nested_key: 'okved_attributes' },
    okei: { class: 'Ok', type: 'belongs_to', nested_key: 'okei_attributes' }
  }
  NOT_INCLUDE = %w(id okdp_id okved_id okei_id lot_id created_at updated_at)

  belongs_to :okdp, foreign_key: :okdp_id, class_name: "Ok"
  belongs_to :okved, foreign_key: :okved_id, class_name: "Ok"
  belongs_to :okei, foreign_key: :okei_id, class_name: "Ok"

  accepts_nested_attributes_for :okdp, :okved, :okei
end
