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
end
