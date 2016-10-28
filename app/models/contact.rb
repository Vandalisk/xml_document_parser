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
# Indexes
#
#  index_contacts_on_organization_id  (organization_id)
#

class Contact < ApplicationRecord
  has_one :organization
end
