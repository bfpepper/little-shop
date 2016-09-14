class Cart::ItemsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @items = @cart.contained_items
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item_id)
    session[:cart] ||= {}
    session[:cart][item.id] ||= 0
    session[:cart][item.id] += 1
    # flash[:notice] = "You have #{pluralize(x, item.title)} in your cart"
    redirect_to cart_items_path
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
