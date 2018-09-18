FactoryBot.define do
  factory :item do
    quantity { BigDecimal.new("1.5") }
    listable
    product
  end
end
