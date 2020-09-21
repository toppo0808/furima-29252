FactoryBot.define do
  factory :item do
    name                     {"apple"}
    explanation              {"ああああああ"}
    category_id              {2}
    status_id                {2}
    fee_id                   {2}
    area_id                  {2}
    sending_date_id          {2}
    price                    {301}
    association :user
  end
end
