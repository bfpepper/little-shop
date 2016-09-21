module Admin
  class DashboardController < Admin::BaseController
    def index
      if current_user.nil?
        render file: 'public/404.html', layout: false
      elsif !current_user.admin?
        redirect_to dashboard_path
      end
      @orders = if params[:filter_by]
                  Order.where(status: params[:filter_by])
                else
                  Order.all
                end
      @breakdown = Order.breakdown
    end
  end
end
