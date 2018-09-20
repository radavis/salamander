FactoryBot.define do
  factory :user do
    provider { :google_oauth2 }
    sequence(:uid) { |n| 10000 + n }
    sequence(:email) { |n| "ex.user.#{n}@example.com" }
    api_key { User.generate_api_key }
  end
end
