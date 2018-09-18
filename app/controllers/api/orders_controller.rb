class Api::OrdersController < Api::BaseController
  def index
    render json: customer.orders
  end

  private

  def customer
    @customer ||= Customer.find(params[:customer_id])
  end
end
