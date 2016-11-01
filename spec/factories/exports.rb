# == Schema Information
#
# Table name: exports
#
#  id               :integer          not null, primary key
#  purchase_number  :string
#  doc_publish_date :datetime
#  href             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :export do
    
  end
end
