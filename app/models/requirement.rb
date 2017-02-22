# frozen_string_literal: true
class Requirement < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient

  validates :quantity, presence: true
end
