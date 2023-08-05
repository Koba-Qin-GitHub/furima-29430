class ItemsController < ApplicationController

  def index
  end
  


  private

  def message_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id)
  end
end
