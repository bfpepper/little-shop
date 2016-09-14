class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart

  def set_cart
    @cart = Cart::Item.new(session[:cart])
  end
end
