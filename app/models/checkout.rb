class Checkout
  def initialize(order_params, contained_items)
    @order_params = order_params
    @contained_items = contained_items
  end

  def save
    user = User.find(@order_params[:user_id])
    order = user.orders.create(@order_params)
    @contained_items.each do |item, quantity|
      quantity.times do
        order.order_items.create(item_id: item.id)
      end
    end
    # ActiveRecord::Base.transaction do
    #   order = user.orders.create!(@order_params)
    # end
  end
end
