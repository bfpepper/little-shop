module Admin
  class DashboardController < Admin::BaseController
    def index
      if params[:filter_by]
        @orders = Order.where(status: params[:filter_by])
      else
        @orders = Order.all
      end
      @breakdown = Order.breakdown
    end
  end
end
