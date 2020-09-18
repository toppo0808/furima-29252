class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :item

  with_options presence: true do
    validates :nickname
    validates :email
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i
    validates :password, format: {with: PASSWORD_REGEX}
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :first_name, format: { with: NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :last_name, format:   { with: NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :first_furigana, format: { with: FURIGANA_REGEX, message: "is invalid. Input full-width katakana characters."}
    validates :last_furigana, format: { with: FURIGANA_REGEX, message: "is invalid. Input full-width katakana characters."}
    validates :birthday
  end

end
