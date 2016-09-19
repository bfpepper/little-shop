module Admin
  class DashboardController < Admin::BaseController
    def index
      redirect_to dashboard_path unless current_user.admin?

      @orders = if params[:filter_by]
                  Order.where(status: params[:filter_by])
                else
                  Order.all
                end
      @breakdown = Order.breakdown
    end
  end
end
