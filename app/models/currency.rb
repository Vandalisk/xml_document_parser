# == Schema Information
#
# Table name: currencies
#
#  id           :integer          not null, primary key
#  code         :string
#  digital_code :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Currency < ApplicationRecord
  # ATTRIBUTES = %i(code digital_code name)
  NOT_INCLUDE = %w(id created_at updated_at)
  ASSOCIATED_MODELS = {}
end
