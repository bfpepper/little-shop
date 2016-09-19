class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    checkout = Checkout.new(order_params, @cart.contained_items)
    checkout.save
    flash[:notice] = 'Order was successfully placed'
    redirect_to orders_path
    # order = current_user.orders.new(order_params)
    # if order.save
    #   redirect_to orders_path
    #   flash[:notice] = 'Order was successfully placed'
    # else
    #   render cart_path
    # end
  end

  private

  def order_params
    { status: 'Ordered', price: @cart.total, user_id: current_user.id }
  end
end
