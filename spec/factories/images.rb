FactoryBot.define do
  factory :image do
    url { Faker::Internet.url}
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 3) }
    category { Faker::IndustrySegments.sector }
  end
end
