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

class DocumentationDelivery < ApplicationRecord
  ASSOCIATED_MODELS = {
    purchase: { class: 'Purchase', type: 'belongs_to', nested_key: 'purchase_attributes' }
  }
  NOT_INCLUDE = %w(id purchase_id created_at updated_at)
end
