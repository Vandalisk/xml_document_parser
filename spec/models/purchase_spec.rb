# == Schema Information
#
# Table name: purchases
#
#  id                         :integer          not null, primary key
#  guid                       :string
#  create_date_time           :datetime
#  registration_number        :integer
#  name                       :string
#  purchase_method_code       :integer
#  purchase_code_name         :string
#  publication_date_time      :datetime
#  modification_date          :datetime
#  status                     :string
#  version                    :integer
#  save_user_id               :integer
#  examination_place          :text
#  examination_date_time      :datetime
#  submission_close_date_time :datetime
#  publication_planned_date   :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
