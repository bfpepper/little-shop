class Checkout
  def initialize(order_params, contained_items)
    @order_params = order_params
    @contained_items = contained_items
  end

  def create
    order = Order.create(@order_params)
    @contained_items.each do |item, quantity|
      quantity.times do
        order.order_items.create(item_id: item.id)
      end
    end
  end
end
