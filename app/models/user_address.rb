class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pay
  belongs_to_active_hash :area

  with_options presence: true do
    validates :pay_id
    validates :area_id
    validates :postal_code
    validates :city
    validates :house_number
    validates :telephone_number, length: { minimum: 11 }
  end
  validates :area_id, numericality: { other_than: 0 } 
end
