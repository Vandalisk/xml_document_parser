# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  full_name      :string
#  short_name     :string
#  inn            :string
#  kpp            :string
#  ogrn           :string
#  legal_address  :string
#  postal_address :string
#  phone          :string
#  email          :string
#  okato          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  purchase_id    :integer
#

class Organization < ApplicationRecord
  ASSOCIATED_MODELS = {
    purchase: { class: 'Purchase', type: 'belongs_to', nested_key: 'purchase_attributes' }
  }
  NOT_INCLUDE = %w(id purchase_id created_at updated_at)
  # ATTRIBUTES = %i(full_name short_name inn kpp ogrn legal_address postal_address phone email okato)
end
