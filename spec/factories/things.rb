# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :thing do
    name Faker::Name.name
    member
  end
end
