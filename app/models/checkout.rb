class Checkout
  def initialize(order_params, contained_items)
    @order_params = order_params
    @contained_items = contained_items
  end

  def create
    user  = User.find(@order_params[:user_id])
    order = Order.create(@order_params)
    create_order_items(order)
    send_sms_confirmation(user)
  end

  def create_order_items(order)
    @contained_items.each do |item, quantity|
      quantity.times do
        order.order_items.create(item_id: item.id)
      end
    end
  end

  def send_sms_confirmation(user)
    if user.phone_number
      MessageSender.send_sms(user.phone_number, 'Order was successfully placed')
    end
  end
end
