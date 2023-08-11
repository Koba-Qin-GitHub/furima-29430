class ShoppingAddressInformation < ApplicationRecord

  validates :postcode,      presence: true
  validates :city,          presence: true
  validates :block,         presence: true
  validates :building
  validates :phone_number,  presence: true



  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"}

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture



  belongs_to :shopping_log

end
