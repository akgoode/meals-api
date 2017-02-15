class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :instructions
end
