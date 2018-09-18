class Item < ApplicationRecord
  belongs_to :listable, polymorphic: true
  belongs_to :product

  scope :created_between, lambda{ |start_date, end_date| where(:created_at => start_date.to_time.beginning_of_day..end_date.to_time.end_of_day) }
  scope :group_by_interval, lambda{ |interval| group("DATE_TRUNC('#{interval}', created_at)") }
end
