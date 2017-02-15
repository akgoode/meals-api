# frozen_string_literal: true
class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
      t.references :meal, foreign_key: true, index: true
      t.references :ingredient, foreign_key: true, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
