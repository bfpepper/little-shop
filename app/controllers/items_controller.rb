class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item)
    .permit(:title, :description, :price, :image)
  end

end
