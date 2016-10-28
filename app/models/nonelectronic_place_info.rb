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
  # ATTRIBUTES = %i(summarizing_place summarizing_date_time purchase_id)
end
