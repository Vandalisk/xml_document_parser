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

require 'rails_helper'

RSpec.describe Organization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
