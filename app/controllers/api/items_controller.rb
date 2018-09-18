class Api::ItemsController < Api::BaseController
  def index
    if items.present?
      render json: items.group_by_interval(params[:interval]).count
    end
  end

  def items
    Item.created_between(params[:start_date], params[:end_date])
  end
end
