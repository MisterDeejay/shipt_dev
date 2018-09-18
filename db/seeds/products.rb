p1 = Product.find_or_create_by(name: 'product1')
p1.update_attributes(
  price: BigDecimal.new("14.95"),
  unit: "lb"
)
p2 = Product.find_or_create_by(name: 'product2')
p2.update_attributes(
  price: BigDecimal.new("4.95"),
  unit: "oz"
)
p3 = Product.find_or_create_by(name: 'product3')
p3.update_attributes(
  price: BigDecimal.new("1.95"),
  unit: "lb"
)
p4 = Product.find_or_create_by(name: 'product4')
p4.update_attributes(
  price: BigDecimal.new("9.50"),
  unit: "grams"
)
p5 = Product.find_or_create_by(name: 'product5')
p5.update_attributes(
  price: BigDecimal.new("10.90"),
  unit: "oz"
)
p6 = Product.find_or_create_by(name: 'product6')
p6.update_attributes(
  price: BigDecimal.new("20.00"),
  unit: nil
)
Timecop.freeze(2.days.ago) do
  p7 = Product.find_or_create_by(name: 'product7')
  p7.update_attributes(
    price: BigDecimal.new("2.90"),
    unit: "oz"
  )
end
Timecop.freeze(2.months.ago) do
  p8 = Product.find_or_create_by(name: 'product8')
  p8.update_attributes(
    price: BigDecimal.new("7.99"),
    unit: "lb"
  )
end
Timecop.freeze(1.year.ago) do
  p9 = Product.find_or_create_by(name: 'product9')
  p9.update_attributes(
    price: BigDecimal.new("199.99"),
    unit: nil
  )
end
Timecop.freeze(2.years.ago) do
  p10 = Product.find_or_create_by(name: 'product10')
  p10.update_attributes(
    price: BigDecimal.new("40.99"),
    unit: "grams"
  )
end

c1 = Category.find(1)
c2 = Category.find(2)
c3 = Category.find(3)

begin
  p1.categories << c1
  p1.categories << c2
  p1.save

  p2.categories << c3
  p2.save

  p3.categories << c2
  p3.categories << c1
  p3.save

  p4.categories << c1
  p4.categories << c2
  p4.categories << c3
  p4.save

  p5.categories << c2

  p6.categories << c1
  p6.categories << c3
  p6.save
rescue => e
end
