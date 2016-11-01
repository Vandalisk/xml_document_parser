# == Schema Information
#
# Table name: exports
#
#  id               :integer          not null, primary key
#  purchase_number  :string
#  doc_publish_date :datetime
#  href             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Export, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
