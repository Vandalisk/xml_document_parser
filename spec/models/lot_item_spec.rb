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

require 'rails_helper'

RSpec.describe LotItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
