class List < ApplicationRecord
  has_many :items, as: :listable
  belongs_to :customer
end
