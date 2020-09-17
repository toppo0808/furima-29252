FactoryBot.define do
  factory :user do
    nickname                  {"aaaaaa"}
    email                     {"kkkkkk@gmail.com"}
    password                  {"abcdef"}
    password_confirmation     {password}
    first_name                {"山田"}
    last_name                 {"太郎"}
    first_furigana            {"ヤマダ"}
    last_furigana             {"タロウ"}
    birthday                  {"2000-09-09"}
  end
end