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

FactoryGirl.define do
  factory :contact do
    first_name { 'Валерий ' }
    middle_name { 'Викторович' }
    last_name { 'Овчаров' }
    phone { '+7 (87770) 91106' }
    fax { '+7 (87770) 91106' }
    email { 'drsu-08@mail.ru' }
    organization
  end
end
