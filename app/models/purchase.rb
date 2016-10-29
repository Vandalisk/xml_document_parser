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
#  contact_id                 :integer
#  customer_id                :integer
#  placer_id                  :integer
#

class Purchase < ApplicationRecord
  ASSOCIATED_MODELS = {
    customer: { class: 'Organization', type: 'belongs_to', nested_key: 'customer_attributes' },
    contact: { class: 'Contact', type: 'belongs_to', nested_key: 'contact_attributes' },
    placer: { class: 'Organization', type: 'belongs_to', nested_key: 'placer_attributes' },
    documentationDelivery: {
      class: 'DocumentationDelivery', type: 'has_one',
      nested_key: 'documentation_delivery_attributes'
    },
    attachments: {
      class: 'Attachment', type: 'has_many',  item_key: 'document',
      nested_key: 'attachments_attributes'
    },
    nonelectronicPlaceInfo: {
      class: 'NonelectronicPlaceInfo', type: 'has_one',
      nested_key: 'nonelectronic_place_info_attributes'
    },
    lots: {
      class: 'Lot', type: 'has_many', item_key: 'lot', nested_key: 'lots_attributes'
    }
  }
  NOT_INCLUDE = %w(id contact_id customer_id placer_id created_at updated_at)

  belongs_to :customer, class_name: "Organization", autosave: true
  belongs_to :placer, class_name: "Organization", autosave: true
  belongs_to :contact
  has_one :documentation_delivery
  has_one :nonelectronic_place_info
  has_many :attachments
  has_many :lots

  accepts_nested_attributes_for :customer,
                                :placer,
                                :contact,
                                :documentation_delivery,
                                :attachments,
                                :nonelectronic_place_info,
                                :lots

  delegate :organization, to: :contact, allow_nil: true

  def autosave_associated_records_for_customer
    if db_organization = Organization.find_by(ogrn: customer.ogrn)
      self.customer = db_organization
    else
      self.customer.save!
      self.customer = customer
    end
  end

  def autosave_associated_records_for_placer
    if db_organization = Organization.find_by(ogrn: placer.ogrn)
      self.placer = db_organization
    else
      self.placer.save!
      self.placer = placer
    end
  end
end
