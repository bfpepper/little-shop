class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    checkout = Checkout.new(order_params, @cart.contained_items)
    checkout.create
    flash[:notice] = 'Order was successfully placed'
    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    order.update_attribute(:status, params[:new_status])
    redirect_to request.referrer
  end
  
  private

  def order_params
    { status: 'Ordered', price: @cart.total, user_id: current_user.id }
  end
end
