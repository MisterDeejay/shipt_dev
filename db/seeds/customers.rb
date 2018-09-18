Customer.find_or_create_by(first_name: "Aname").update_attributes(
  last_name: "Alastname",
  email: "Aname@name.com"
)
Customer.find_or_create_by(first_name: "Customer1").update_attributes(
  last_name: "Lastname1",
  email: "customer1@shipt.com"
)
