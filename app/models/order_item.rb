class OrderItem < ApplicationRecord
  belongs_to :orders
  belongs_to :items
end
