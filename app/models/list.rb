class List < ApplicationRecord
  has_many :items, as: :listable, dependent: :destroy
  belongs_to :customer
end
