i1 = Item.find_or_create_by(product: Product.find(1))
i1.update_attributes(
  quantity: BigDecimal.new("14.95"),
  listable: Order.find(1)
)
i2 = Item.find_or_create_by(product: Product.find(2))
i2.update_attributes(
  quantity: BigDecimal.new("4.95"),
  listable: Order.find(1)
)
i3 = Item.find_or_create_by(product: Product.find(2))
i3.update_attributes(
  quantity: BigDecimal.new("1.95"),
  listable: Order.find(2)
)
i4 = Item.find_or_create_by(product: Product.find(3))
i4.update_attributes(
  quantity: BigDecimal.new("9.50"),
  listable: Order.find(2)
)
i5 = Item.find_or_create_by(product: Product.find(4))
i5.update_attributes(
  quantity: BigDecimal.new("10.90"),
  listable: Order.find(1)
)
i6 = Item.find_or_create_by(product: Product.find(4))
i6.update_attributes(
  quantity: BigDecimal.new("20.00"),
  listable: Order.find(2)
)
Timecop.freeze(2.days.ago) do
  i7 = Item.find_or_create_by(product: Product.find(5))
  i7.update_attributes(
    quantity: BigDecimal.new("2.90"),
    listable: Order.find(2)
  )
end
Timecop.freeze(2.months.ago) do
  i8 = Item.find_or_create_by(product: Product.find(5))
  i8.update_attributes(
    quantity: BigDecimal.new("7.99"),
    listable: Order.find(1)
  )
end
Timecop.freeze(1.year.ago) do
  i9 = Item.find_or_create_by(product: Product.find(6))
  i9.update_attributes(
    quantity: BigDecimal.new("199.99"),
    listable: Order.find(1)
  )
end
Timecop.freeze(2.years.ago) do
  i10 = Item.find_or_create_by(product: Product.find(7))
  i10.update_attributes(
    quantity: BigDecimal.new("40.99"),
    listable: Order.find(2)
  )
end
