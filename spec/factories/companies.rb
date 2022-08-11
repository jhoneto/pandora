FactoryBot.define do
  factory :company do
    organization
    name { Faker::Company.name }
  end
end
