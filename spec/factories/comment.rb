FactoryBot.define do
    factory :comment do
      content { Faker::Lorem.sentence(1, true) }
      association :user
      association :movie
      created_at { Faker::Date.between(from: Date.today, to: Date.today) }

      trait :with_date do
        created_at { Faker::Date.between(from: 14.days.ago, to: 14.days.ago) }
      end
    end
  end