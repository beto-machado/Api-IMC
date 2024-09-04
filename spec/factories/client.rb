FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    weight { Faker::Number.decimal(l_digits: 2) }
    height { Faker::Number.decimal(l_digits: 2) }
  end
end
