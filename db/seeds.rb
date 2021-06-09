# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

15.times do
  Project.create(
    name: Faker::Name.name,
    user_id: rand(1..User.count)
  )
end

50.times do
  Feature.create(
    title: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    ticket_id: Faker::Bank.account_number(digits: 8),
    panel_name: 'current' || 'icebox' || 'backlog',
    status: 'completed' || 'started' || 'delivered' || 'unstarted',
    project_id: rand(1..Project.count)
  )
end

100.times do
  Task.create(
    description: Faker::Lorem.paragraph,
    status: false,
    feature_id: rand(1..Feature.count)
  )
end

100.times do
  Comment.create(
    comment: Faker::Lorem.paragraph,
    feature_id: rand(1..Feature.count),
    user_id: rand(1..User.count)
  )
end
