FactoryBot.define do
  factory :pay_user_address do
    postal_code {'123-4567'}
    telephone_number {'09012341234'}
    area_id {2}
    city {'東京'}
    house_number {'1-1'}
    token {"aa_aaa_4897f2r50753664c30cb22c1"}
    user_id {1}
    item_id {2}
  end
end
