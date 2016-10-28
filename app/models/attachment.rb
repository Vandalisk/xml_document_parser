# == Schema Information
#
# Table name: attachments
#
#  id               :integer          not null, primary key
#  guid             :string
#  create_date_time :datetime
#  file_name        :string
#  description      :text
#  url              :string
#  purchase_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Attachment < ApplicationRecord
  # ATTRIBUTES = %i(guid create_date_time file_name description url purchase_id)
  ASSOCIATED_MODELS = {
    purchase: { class: 'Purchase', type: 'belongs_to', nested_key: 'purchase_attributes' }
  }

  NOT_INCLUDE = %w(id purchase_id created_at updated_at)
end
