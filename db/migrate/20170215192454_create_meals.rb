# frozen_string_literal: true
class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.text :name, null: false
      t.text :ingredients, null: false
      t.text :instructions

      t.timestamps null: false
    end
  end
end
