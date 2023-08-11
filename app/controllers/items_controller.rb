class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])

    user_check
  end

  def update
    @item = Item.find(params[:id])

    user_check

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  


  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id) 
  end

  def user_check 
    unless current_user == @item.user
      redirect_to root_path
    end
  end

end
