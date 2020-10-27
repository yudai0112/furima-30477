class OrdersController < ApplicationController

  def index
    @order = OrderBuy.new
  end

  def create
    @order = OrderBuy.new(buy_params)
    if 
    @order.save
    redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:postal_code, :area_id, :city, :address, :building,:tel,:item_id).merge( user_id: current_user.id)
  end

end

