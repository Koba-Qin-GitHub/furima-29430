require 'rails_helper'

RSpec.describe ShoppingLog, type: :model do
  before do
    @shopping_log = FactoryBot.build(:shopping_log)
  end

  # context '内容に問題ない場合' do
  #   it "priceとtokenがあれば保存ができること" do
  #     binding.pry
  #     expect(@shopping_log).to be_valid
  #   end
  # end

  # context '内容に問題がある場合' do
  #   it "priceが空では保存ができないこと" do
  #     @shopping_log.price = nil
  #     @shopping_log.valid?
  #     expect(@shopping_log.errors.full_messages).to include("Price can't be blank")
  #   end

  #   it "tokenが空では登録できないこと" do
  #     @shopping_log.token = nil
  #     @shopping_log.valid?
  #     expect(@shopping_log.errors.full_messages).to include("Token can't be blank")
  #   end
  # end
end
