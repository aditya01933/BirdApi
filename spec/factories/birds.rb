FactoryGirl.define do
  factory :bird do
    name Faker::Name.name 
    family Faker::Name.name 
    continents Faker::Address.country
    added Date.today
    visible true
  end
end
