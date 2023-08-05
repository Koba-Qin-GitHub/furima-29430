class Item < ApplicationRecord


  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipment_date



  belongs_to :user
  # has_one :shopping_log

  has_one_attached :image

 

end
