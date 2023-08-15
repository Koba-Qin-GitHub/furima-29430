class ShoppingLogAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :shopping_log_id, :user_id, :item_id, :token


  # shopping_log バリデーション
  validates :user_id,          presence: true
  validates :item_id,          presence: true
  validates :token,            presence: true



  # shopping_address_information バリデーション
  validates :postcode,              presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :city,                  presence: true
  validates :block,                 presence: true

  validates :phone_number,
      presence: true,
      length: { minimum: 10, maximum: 11, message: "is too short" },  
      format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" }
  

   



  def save

    shopping_log = ShoppingLog.create(user_id: user_id,item_id: item_id)

    ShoppingAddressInformation.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, shopping_log_id: shopping_log.id)
  
  end
end
