# frozen_string_literal: true
class AddUserToMeals < ActiveRecord::Migration[5.0]
  def change
    add_reference :meals, :user, foreign_key: true, index: true
  end
end
