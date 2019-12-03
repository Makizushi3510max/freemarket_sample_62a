FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"aaaa0000"}
    last_name             {"あべ"}
    first_name            {"ひろし"}
    last_name_kana        {"アベ"}
    first_name_kana       {"ヒロシ"}
    date_of_birth         {"2000-2-20"}
    phone_number          {"11122223333"}
  end

end