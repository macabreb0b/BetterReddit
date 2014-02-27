# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title { Faker::Internet.domain_word }
    url { Faker::Internet.url }
    body { Faker::Lorem.paragraph(3) }
    user_id { FactoryGirl.create(:user).id }
  end
end
