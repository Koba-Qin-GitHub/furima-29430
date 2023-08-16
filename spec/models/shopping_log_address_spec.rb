require 'rails_helper'

RSpec.describe ShoppingLogAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @shopping_log_address = FactoryBot.build(:shopping_log_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shopping_log_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @shopping_log_address.building = ''
        expect(@shopping_log_address).to be_valid
      end
    end


    context '内容に問題がある場合' do

      it 'postcode が空だと保存できないこと' do
        @shopping_log_address.postcode  = ''
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcode が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shopping_log_address.postcode  = '1234567'
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it 'prefecture_id を選択していないと保存できないこと' do
        @shopping_log_address.prefecture_id = 1
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'city が空だと保存できないこと' do
        @shopping_log_address.city = ''
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("City can't be blank")
      end

      it 'block が空だと保存できないこと' do
        @shopping_log_address.block = ''
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_number が空だと保存できないこと' do
        @shopping_log_address.phone_number = ''
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number が9文字以下だと保存できないこと' do
        @shopping_log_address.phone_number = '123456789'
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_number が12文字以上だと保存できないこと' do
        @shopping_log_address.phone_number = '012345678912'
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_number が全角文字だと保存できないこと' do
        @shopping_log_address.phone_number = '０１２３４５６７８９'
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'token が空だと保存できないこと' do
        @shopping_log_address.token = ''
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Token can't be blank")
      end




      
      it 'user が紐付いていないと保存できないこと' do
        @shopping_log_address.user_id = nil
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item が紐付いていないと保存できないこと' do
        @shopping_log_address.item_id = nil
        @shopping_log_address.valid?
        expect(@shopping_log_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
