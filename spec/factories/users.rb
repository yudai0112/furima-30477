FactoryBot.define do

  factory :user do
    nickname              {"yudai"}
    email                 {"yudai@gmail.com"}
    password              {"a12345"}
    encrypted_password    {"a12345"}
    first_name           {"田中"}
    first_name_kana      {"タナカ"}
    last_name            {"太郎"}
    last_name_kana       {"タロウ"}
    birthday             {"1985-01-12"}
  end
end