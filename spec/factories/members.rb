# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    nick_name Faker::Name.name
    email Faker::Internet.email
    password { 'sharestuff' }
  end
end
