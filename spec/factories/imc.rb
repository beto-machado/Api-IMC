FactoryBot.define do
  factory :imc do
    value { 22.5 }
    message { 'Normal weight' }
    obesity_degree { '0' }
    association :client
  end
end
