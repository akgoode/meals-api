# frozen_string_literal: true
class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients, through: :requirements
  has_many :requirements, dependent: :destroy

  validates :name, presence: true
end
