# frozen_string_literal: true
class Ingredient < ApplicationRecord
  has_many :meals, through: :requirements
  has_many :requirements

  validates :name, presence: true
  validates :unit, presence: true
end
