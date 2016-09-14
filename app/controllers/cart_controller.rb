class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    @items = @cart.contained_items
  end

  def update
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    # flash[:notice] = "You have #{pluralize(x, item.title)} in your cart"
    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully removed #{view_context.link_to item.title, item_path(item)} from your cart."
    redirect_to cart_path
  end

#   def create
#   politician = Politician.find(params[:politician_id])
#   @cart.add_politician(politician.id)
#
#   session[:cart] = @cart.contents
#   redirect_to politicians_path
# end
#
# def index
#   @politicians = @cart.contained_politicians
# end

end
