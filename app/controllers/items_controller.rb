class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :product_copy, :price, :category_id, :status_id, :burden_id, :area_id, :area_day_id, :image).merge(user_id: current_user.id)
  end
end
