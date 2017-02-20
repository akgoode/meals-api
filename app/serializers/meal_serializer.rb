# frozen_string_literal: true
class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :instructions, :requirements

  # def editable
  #   scope == object.user
  # end
end
