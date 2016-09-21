class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def add_item(item_id)
    contents[item_id.to_s] += 1
  end

  def remove_item(item_id)
    contents.delete(item_id.to_s)
  end

  def total
    contents.reduce(0) do |total, (item_id, quantity)|
      item = Item.find(item_id)
      total += (item.price * quantity)
      total
    end
  end

  def change_quantity(item_id, quantity)
    contents[item_id.to_s] += quantity.to_i
  end

  def contained_items
    contents.map do |item_id, quantity|
      [Item.find(item_id), quantity]
    end.to_h
  end
end
