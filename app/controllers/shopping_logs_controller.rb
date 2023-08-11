class ShoppingLogsController < ApplicationController

  def index
  
  end

  def new

  end

  def create
    @shopping_log = ShoppingLog.create(shopping_log_params)
    ShoppingAddressInformation.create(shopping_address_information_params)
    redirect_to root_path

  end



  private

  def shopping_log_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def shopping_address_information_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(shopping_log_id: @shopping_log.id)
  end

end
