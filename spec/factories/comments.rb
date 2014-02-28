# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id { FactoryGirl.create(:user).id }
    parent_comment_id nil
    sequence(:body) { |n| "Comment #{n}. " + Faker::Lorem.paragraph(1) }
    # body { Faker::Lorem.paragraph(2) }
    factory :comment_with_link do
      link_id { FactoryGirl.create(:simple_link).id }
    end
  end
end
