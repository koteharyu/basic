FactoryBot.define do
  factory :post do
    body { Faker::Hacker.say_something_smart }
    images { [File.open("#{Rails.root}/spec/fixtures/TacoRice.jpeg")] }
    user
  end
end
