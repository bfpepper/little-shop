class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def contained_items
    items.each_with_object(Hash.new(0)) do |item, collection|
      collection[item] += 1
    end
  end
end
