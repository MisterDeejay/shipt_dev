class Analyzers::Strategies::CategoryQuantityStrategy
  def initialize
    super(
      <<-EOF
             SELECT cu.id customer_id, cu.first_name customer_first_name,
               cp.category_id category_id, c.name category_name, SUM(quantity) number_purchased
               FROM items i
               LEFT JOIN categories_products cp ON i.product_id = cp.product_id
               LEFT JOIN categories c ON cp.category_id = c.id
               LEFT JOIN orders o ON i.listable_id = o.id
               LEFT JOIN customers cu ON o.customer_id = cu.id
               WHERE i.listable_type='Order'
               GROUP BY cp.category_id, cu.id, c.name
               ORDER BY cu.id;
           EOF
    )
  end
  
  def analyze
    ActiveRecord::Base.connection.execute(@query)
  end
end
