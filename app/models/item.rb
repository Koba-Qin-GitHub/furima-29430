class Item < ApplicationRecord


  validates :name,                 presence: true
  validates :content,              presence: true
  validates :price,                numericality: { in: 300..9999999 }
  validates :category_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,            numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_date_id,     numericality: { other_than: 1 , message: "can't be blank"}


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
