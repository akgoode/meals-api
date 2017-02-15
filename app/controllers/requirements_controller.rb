# frozen_string_literal: true
class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:destroy]
  def create
    @requirement = Requirement.new(requirement_params)

    if @requirement.save
      render json: @requirement, status: :created
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @requirement.destroy
  end

  def set_requirement
    @requirement = Requirement.find(params[:id])
  end
  private :set_requirement

  def requirement_params
    params.require(:requirement).permit(:ingredient_id, :recipe_id, :quantity)
  end
  private :requirement_params
end
