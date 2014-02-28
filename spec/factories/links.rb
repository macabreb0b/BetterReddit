# == Schema Information
#
# Table name: links
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  url            :string(255)
#  body           :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  upvote_count   :integer
#  downvote_count :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title { Faker::Internet.domain_word }
    url { Faker::Internet.url }
    body { Faker::Lorem.paragraph(3) }
    user_id { FactoryGirl.create(:user).id }
    after(:create) do |link, eval|
      create_list(:comment, 2, link: link)
    end

    # factory :link_more_comments do
#       after(:create) do |link, eval|
#         create_list(:comment, 5, link_id: link, parent_comment_id: 2)
#       end
#     end
  end

  factory :simple_link, class: "Link" do
    title { Faker::Internet.domain_word }
    url { Faker::Internet.url }
    body { Faker::Lorem.paragraph(3) }
    user_id { rand(10) + 1 }
  end

end
