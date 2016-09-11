FactoryGirl.define do
  factory :bird do
    name Faker::Name.name 
    family Faker::Name.name 
    continents [Faker::Address.country, Faker::Address.country]
    visible true
  end
end
