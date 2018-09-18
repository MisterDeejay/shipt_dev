class Customer < ApplicationRecord
  has_many :addresses
  has_many :orders
  has_many :lists
end
