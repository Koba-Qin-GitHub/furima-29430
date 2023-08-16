FactoryBot.define do
  factory :shopping_log_address do
    postcode                {Faker::Address.numerify('###-####')}
    prefecture_id           {2}
    city                    {Faker::Address.city}
    block                   {Faker::Address.street_address}
    building                {Faker::Address.street_address}
    phone_number            {Faker::Number.number(11)}

    token                   {Faker::Internet.device_token}





  end
end
