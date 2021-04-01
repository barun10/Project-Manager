# frozen_string_literal: true

FactoryBot.define do
  factory :task, class: Task do
    description { Faker::Lorem.paragraph }
    status { false }
  end
end
