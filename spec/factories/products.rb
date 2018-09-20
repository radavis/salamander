FactoryBot.define do
  factory :product do
    sequence(:upc) { |n| (100_000_000_000 + n).to_s }
    title { "MyString" }
    data { "MyText" }
  end
end
