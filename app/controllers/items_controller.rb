class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.all.order(created_at: :DESC)
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
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
