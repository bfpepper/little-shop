class HomeController < ApplicationController
  def show
    @items = Item.limit(4).order('RANDOM()')
  end
end
