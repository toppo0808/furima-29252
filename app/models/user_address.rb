class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pay
  belongs_to_active_hash :area

  with_options presence: true do
    validate :pay_id
    validate :area_id
    validate :postal_code
    validate :city
    validate :house_number
    validate_inclusion_of :telephone_number, in: 10..11
  end
end
