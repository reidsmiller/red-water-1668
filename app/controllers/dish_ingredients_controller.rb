class DishIngredientsController < ApplicationController
  def create
    DishIngredient.create(dish_ingredient_params)
    redirect_to dish_path(dish_ingredient_params[:dish_id])
  end

  private
  def dish_ingredient_params
    params.require(:dish_ingredient).permit(:dish_id, :ingredient_id)
  end
end