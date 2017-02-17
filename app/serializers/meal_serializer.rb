# frozen_string_literal: true
class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :instructions

  def ingredients
    object.ingredients.pluck(:name)
  end

  # def editable
  #   scope == object.user
  # end
end
