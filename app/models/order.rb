class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user
<<<<<<< HEAD

  def contained_items
    self.items.each_with_object(Hash.new(0)) do |item, collection|
      collection[item] += 1
    end
  end
=======
>>>>>>> development
end
