class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end
end
