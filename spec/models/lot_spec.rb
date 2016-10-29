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

require 'rails_helper'

RSpec.describe Lot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
