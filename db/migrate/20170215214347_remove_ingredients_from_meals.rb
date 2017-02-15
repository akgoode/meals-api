# frozen_string_literal: true
class RemoveIngredientsFromMeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :ingredients, :text
  end
end
