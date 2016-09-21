class OrdersController < ApplicationController
  def index
  end

  def show
    if current_user && (current_user.has_order?(params[:id]) || current_user.admin?)
      @order = Order.find(params[:id])
    elsif current_user
      redirect_to orders_path
    else
      redirect_to root_path
    end
  end

  def create
    if @cart.total == 0
      redirect_to cart_path
    else
      process_checkout
    end
  end

  def update
    order = Order.find(params[:id])
    order.update_attribute(:status, params[:new_status])
    redirect_to request.referrer
  end

  private

  def order_params
    { status: 'ordered', price: @cart.total, user_id: current_user.id }
  end

  def process_checkout
    checkout = Checkout.new(order_params, @cart.contained_items)
    checkout.create
    flash[:notice] = 'Order was successfully placed'
    session[:cart] = nil
    redirect_to orders_path
  end
end
