# frozen_string_literal: true

FactoryBot.define do
  factory :project, class: Project do
    name { Faker::Name.name }
  end
end
