FactoryBot.define do
  factory :shopping_log do

    association :user
    association :item

  end
end
