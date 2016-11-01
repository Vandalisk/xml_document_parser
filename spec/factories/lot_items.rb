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

FactoryGirl.define do
  factory :lot_item do
    guid { '5d1ccc91-1500-479f-b2f3-0248d09a8e64' }
    ordinal_number { '1' }
    qty { '235' }
  end
end
