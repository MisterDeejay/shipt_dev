FactoryBot.define do
  factory :product do
    name { "product name" }
    price { BigDecimal.new("4.99") }
    unit { "oz" }
  end
end
