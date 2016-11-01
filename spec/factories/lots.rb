# == Schema Information
#
# Table name: lots
#
#  id             :integer          not null, primary key
#  guid           :string
#  ordinal_number :integer
#  subject        :string
#  currency_id    :integer
#  initial_sum    :decimal(8, 2)
#  delivery_place :string
#  purchase_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :lot do
    guid { '5d1ccc91-1500-479f-b2f3-0248d09a8e64' }
    ordinal_number { '1' }
    subject { 'Поставка дорожных знаков для нужд ГУП РА "Кошехабльский ДРСУ"  ' }
    initial_sum { '227674.00' }
    delivery_place { '385400, Россия, Республика Адыгея, Кошехабльский район, аул Кошехабль, ул. Дружбы Народов, 74' }
  end
end
