# frozen_string_literal: true
class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions

  def ingredients
    object.ingredients.pluck(:name)
  end

  # def editable
  #   scope == object.user
  # end
end
