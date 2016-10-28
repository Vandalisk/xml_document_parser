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
  # ATTRIBUTES = %i(guid ordinal_number okdp_id okved_id okei_id lot_id qty)

  has_one :okdp, foreign_key: :okdp_id, class_name: "Ok"
  has_one :okved, foreign_key: :okved_id, class_name: "Ok"
  has_one :okei, foreign_key: :okei_id, class_name: "Ok"
end
