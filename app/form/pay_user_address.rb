class PayUserAddress

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:pay_id,:area_id,:postal_code,:city,:house_number,:telephone_number,:building_number

  def save
    pay = Pay.create(user_id: user_id, item_id: item_id)

    UserAddress.create(pay_id: pay.id, area_id: area_id, postal_code: postal_code, city: city, house_number:house_number, building_number: building_number, telephone_number: telephone_number)
  end

end