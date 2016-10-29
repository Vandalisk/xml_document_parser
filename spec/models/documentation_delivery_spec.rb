# == Schema Information
#
# Table name: documentation_deliveries
#
#  id                       :integer          not null, primary key
#  delivery_start_date_time :datetime
#  delivery_end_date_time   :datetime
#  place                    :string
#  procedure                :text
#  purchase_id              :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'rails_helper'

RSpec.describe DocumentationDelivery, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
