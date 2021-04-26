# frozen_string_literal: true

FactoryBot.define do
  factory :feature, class: Feature do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    ticket_id  { Faker::Bank.account_number(digits: 8) }
    panel_name { 'current' || 'icebox' || 'backlog' }
    status { 'completed' || 'started' || 'delivered' }
  end
end
