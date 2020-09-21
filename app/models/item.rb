class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :area
  belongs_to_active_hash :sending_date
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates_inclusion_of :price, in: 300..99999999, message: 'This site is only for under 99999999 and over 300'
    validates :fee_id
    validates :area_id
    validates :sending_date_id
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :sending_date_id, numericality: { other_than: 1 } 

end
