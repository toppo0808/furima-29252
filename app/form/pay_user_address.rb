class PayUserAddress

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:pay_id,:area_id,:postal_code,:city,:house_number,:telephone_number,:building_number, :token

  with_options presence: true do
    validates :area_id
    POSTALREGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code,format: {with: POSTALREGEX}
    validates :city
    validates :house_number
    TELEPHONEREGEX = /\A\d{10,11}\z/
    validates :telephone_number,format: {with: TELEPHONEREGEX}
    validates :token
  end
  validates :area_id, numericality: { other_than: 0 } 

  def save
    pay = Pay.create(user_id: user_id, item_id: item_id)

    UserAddress.create(pay_id: pay.id, area_id: area_id, postal_code: postal_code, city: city, house_number:house_number, building_number: building_number, telephone_number: telephone_number)
  end

end