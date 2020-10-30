class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_item, only: [:index,:create]

  def index
    @order = OrderBuy.new
    if @item.user.id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order = OrderBuy.new(buy_params)
    if @order.valid?
    pay_item
    @order.save
    redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit( :token, :postal_code, :area_id, :city, :address, :building,:tel,:item_id).merge( user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency:'jpy'
    )
  end

end

