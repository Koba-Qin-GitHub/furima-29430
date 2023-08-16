class ShoppingLog < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :shopping_address_information


end
