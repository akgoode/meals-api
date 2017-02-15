# frozen_string_literal: true
class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.text :name
      t.text :unit

      t.timestamps
    end
  end
end
