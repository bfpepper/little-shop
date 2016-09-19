module Admin
  class DashboardController < Admin::BaseController
    def index
      @orders = if params[:filter_by]
                  Order.where(status: params[:filter_by])
                else
                  Order.all
                end
      @breakdown = Order.breakdown
    end
  end
end
