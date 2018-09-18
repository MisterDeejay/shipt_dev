FactoryBot.define do
  factory :order, aliases: [ :listable ] do
    customer
  end
end
