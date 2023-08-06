class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  


  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id) 
  end
end
