class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @dish_ingredient = DishIngredient.new
  end
end