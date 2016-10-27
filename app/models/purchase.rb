class Purchase < ApplicationRecord
  belongs_to :customer, foreign_key: :customer_id, class_name: "Organization"
  belongs_to :placer, foreign_key: :placer_id, class_name: "Organization"
  belongs_to :contact
end
