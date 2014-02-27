# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    password_digest "MyString"
    username "MyString"
    token "MyString"
  end
end
