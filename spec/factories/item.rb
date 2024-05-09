# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "test_item_#{n}" }
    association :user, factory: :user
    price { 10 }

    trait :sold do
      is_sold { true }
    end

    trait :nsfw do
      is_nsfw { true }
    end
  end
end
