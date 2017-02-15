# frozen_string_literal: true
class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all

    render json: @ingredients
  end

  # GET /ingredients/1
  def show
    render json: @ingredient
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      head :no_content
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
  private :set_ingredient

  # Only allow a trusted parameter "white list" through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :unit)
  end
  private :ingredient_params
end
