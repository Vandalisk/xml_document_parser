# == Schema Information
#
# Table name: oks
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ok < ApplicationRecord
  # ATTRIBUTES = %i(code name)
end
