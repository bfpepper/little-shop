module Admin
  class ItemsController < Admin::BaseController

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to item_path(@item)
      else
        @categories = Category.all
        render :new
      end
    end

    def new
      @categories = Category.all
      @item = Item.new
    end

    private

    def item_params
      params.require(:item)
      .permit(:title, :description, :price, :category_id, :image)
    end
  end
end
