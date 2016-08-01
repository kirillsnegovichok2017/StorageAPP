FactoryGirl.define do
  factory :record do
    name  { Faker::File.file_name('root/') }
    attachment  { Faker::Internet.url }
  end
end