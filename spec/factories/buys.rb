FactoryBot.define do
  factory :OrderBuy do
    postal_code { '111-1111' } # 郵便番号
    area_id { 2 } # 都道府県
    city { '草津市' } # 市区町村
    address { '123' } # 番地
    tel { "09012344321" } # 電話番号
    token {"tok_abcdefghijk00000000000000000"}
    # association :order 
  end
end
