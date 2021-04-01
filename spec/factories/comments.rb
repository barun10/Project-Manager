# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: Comment do
    comment { Faker::Lorem.paragraph }
  end
end
