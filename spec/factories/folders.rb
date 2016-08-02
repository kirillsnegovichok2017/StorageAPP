FactoryGirl.define do
  factory :folder do
    name { Faker::Lorem.word }
    info { Faker::Lorem.sentence }
  end
end