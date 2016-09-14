class Cart::Items <
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    contents.reduce(0) do |total, (item_id, quantity)|
      item = Item.find(item_id)
      total += (item.price * quantity)
      return total
    end
  end

  def contained_items
    contents.map do |item_id, quantity|
      Item.find(item_id)
    end
  end
end
