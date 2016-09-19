class ErrorsController < ApplicationController
  def not_found
    render file: '/public/404', layout: false
  end
end
