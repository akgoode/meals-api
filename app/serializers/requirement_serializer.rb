# frozen_string_literal: true
class RequirementSerializer < ActiveModel::Serializer
  attributes :id, :ingredient_id, :meal_id, :quantity
end
