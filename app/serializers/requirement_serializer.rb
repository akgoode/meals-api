# frozen_string_literal: true
class RequirementSerializer < ActiveModel::Serializer
  attributes :meal_id, :ingredient_id, :quantity
end
