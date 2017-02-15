# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

# %w(Andy Steve Maura Dan Jackson Yana).each do |user|
#   user_params = {
#     email: user
#   }
#   next if User.exists? user_params
#   User.create! user_params
# end

user1 = User.create!(email: 'hi', password: 'hi', password_confirmation: 'hi')

%w(meal1 meal2 meal3 meal4).each do |meal|
  meal_params = {
    name: meal,
    ingredients: 'bacon, eggs, cheese, bread',
    instructions: 'Cook',
    user_id: user1.id
  }
  next if Meal.exists? meal_params
  Meal.create! meal_params
end

%w(eggs cheese bacon bread).each do |ingredient|
  ingredient_params = {
    name: ingredient,
    unit: 'Pounds'
  }
  next if Ingredient.exists? ingredient_params
  Ingredient.create! ingredient_params
end
