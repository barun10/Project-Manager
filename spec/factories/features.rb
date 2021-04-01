# frozen_string_literal: true

FactoryBot.define do
  factory :feature, class: Feature do
    title { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
    panel_name { 'current' || 'icebox' || 'backlog' }
    status { 'completed' || 'started' || 'delivered' }
  end
end
