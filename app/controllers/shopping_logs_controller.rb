class ShoppingLogsController < ApplicationController

  def index
    set_item
    @shopping_log_address = ShoppingLogAddress.new
  end


  def create
    set_item
    @shopping_log_address = ShoppingLogAddress.new(shopping_log_params)
    
    if @shopping_log_address.valid?

      pay_item
      @shopping_log_address.save
      redirect_to root_path
    else
      render :index
    end

  end



  private

  def shopping_log_params
    params.require(:shopping_log_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: shopping_log_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
