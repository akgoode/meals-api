# frozen_string_literal: true
class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :ings

  def ingredients
    object.ingredients.pluck(:id, :name, :unit)
  end

  def requirements
    object.requirements.pluck(:ingredient_id, :quantity)
  end

  def ings
    object.ingredients.select('ingredients.*, requirements.quantity').each do |ingredient|
    end
  end
end
