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

FactoryGirl.define do
  factory :organization do
    full_name { 'Государственное унитарное предприятие Республики Адыгея "Кошехабльский дорожный ремонтно-строительный участок"' }
    short_name { 'ГУП РА " Кошехабльский ДРСУ"' }
    inn { '0103005265' }
    kpp { '010101001' }
    ogrn { '1020100510033' }
    legal_address { "385400, Адыгея, Дружбы Народов, дом 74" }
    postal_address { "385400, Адыгея, Дружбы Народов, дом 74 " }
    phone { '7-87770-91106' }
    email { 'drsu-08@mail.ru' }
    okato { '79215820001' }
  end
end
