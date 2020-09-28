class Pay < ApplicationRecord
belongs_to: user
belongs_to: item

  with_options presence: true do
    validate :user_id
    validate :item_id
  end

end
