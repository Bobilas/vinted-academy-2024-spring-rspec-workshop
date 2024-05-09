# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user_#{n}" }

    trait :verified do
      is_verified { true }
    end
  end
end
