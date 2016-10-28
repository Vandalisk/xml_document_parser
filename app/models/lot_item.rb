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
#  qty            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LotItem < ApplicationRecord
end
