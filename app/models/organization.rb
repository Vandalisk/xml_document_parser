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
#

class Organization < ApplicationRecord
  ASSOCIATED_MODELS = {
    purchase: { class: 'Purchase', type: 'has_many', item_key: 'purchase', nested_key: 'purchases_attributes' },
    contacts: { class: 'Contact', type: 'has_many', item_key: 'contact', nested_key: 'contacts_attributes' }
  }
  NOT_INCLUDE = %w(id purchase_id created_at updated_at)
  # ATTRIBUTES = %i(full_name short_name inn kpp ogrn legal_address postal_address phone email okato)
  has_many :purchases
  has_many :contacts

  accepts_nested_attributes_for :purchases, :contacts
end
