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
end
