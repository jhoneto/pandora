# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    organization
    name { Faker::Company.name }
  end
end
