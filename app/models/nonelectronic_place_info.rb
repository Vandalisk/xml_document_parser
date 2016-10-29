# == Schema Information
#
# Table name: nonelectronic_place_infos
#
#  id                    :integer          not null, primary key
#  summarizing_place     :string
#  summarizing_date_time :datetime
#  purchase_id           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class NonelectronicPlaceInfo < ApplicationRecord
  ASSOCIATED_MODELS = {
    purchase: { class: 'Purchase', type: 'belongs_to', nested_key: 'purchase_attributes' }
  }
  NOT_INCLUDE = %w(id purchase_id created_at updated_at)
end
