# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  first_name      :string
#  middle_name     :string
#  last_name       :string
#  phone           :string
#  fax             :string
#  email           :string
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Contact < ApplicationRecord
  # ATTRIBUTES = %i(guid first_name middle_name last_name phone fax email organization_id)
  ASSOCIATED_MODELS = {
    organization: {
      class: 'Organization', type: 'belongs_to', nested_key: 'organization_attributes'
    }
  }

  NOT_INCLUDE = %w(id organization_id created_at updated_at)

  belongs_to :organization, autosave: true
  has_many :purchases

  accepts_nested_attributes_for :organization

  def autosave_associated_records_for_organization
    if db_organization = Organization.find_by(ogrn: organization.ogrn)
      self.organization = db_organization
    else
      self.organization.save!
    end
  end
end
