# == Schema Information
#
# Table name: purchases
#
#  id                         :integer          not null, primary key
#  guid                       :string
#  create_date_time           :datetime
#  registration_number        :integer
#  name                       :string
#  customer_id                :integer
#  purchase_method_code       :integer
#  purchase_code_name         :string
#  placer_id                  :integer
#  contact                    :integer
#  publication_date_time      :datetime
#  modification_date          :datetime
#  documentation_delivery     :integer
#  status                     :string
#  version                    :integer
#  save_user_id               :integer
#  nonelectronic_place_info   :integer
#  examination_place          :text
#  examination_date_time      :datetime
#  submission_close_date_time :datetime
#  publication_planned_date   :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :customer, foreign_key: :customer_id, class_name: "Organization"
  belongs_to :placer, foreign_key: :placer_id, class_name: "Organization"
  belongs_to :contact
end
