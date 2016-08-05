FactoryGirl.define do
  factory :record do
    attachment  { Faker::Internet.url }
  end
end