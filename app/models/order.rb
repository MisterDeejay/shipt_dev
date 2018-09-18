class Order < ApplicationRecord
  include AASM
  has_many :items, as: :listable
  belongs_to :customer

  aasm do
    state :waiting, initial: true
    state :on_its_way
    state :delivered

    event :fulfill do
      transitions from: :waiting, to: :on_its_way
    end

    event :deliver do
      transitions from: :on_its_way, to: :delivered
    end
  end
end
