require 'rails_helper'

RSpec.describe 'chef_path', type: :feature do
  describe 'As a visitor, when I visit a chefs show page' do
    before(:each) do
      @chef1 = Chef.create!(name: 'Reid')
      @dish1 = Dish.create!(name: 'Reids Super Congee', description: 'Congee so good that youre life will feel so fulfilling that youd be okay with dying after consuming', chef_id: @chef1.id)
      @ingredient1 = Ingredient.create!(name: 'Rice', calories: 200)
      @ingredient2 = Ingredient.create!(name: 'Garlic', calories: 25)
      @ingredient3 = Ingredient.create!(name: 'Chicken Broth', calories: 50)
      @ingredient4 = Ingredient.create!(name: 'Ginger', calories: 25)
      @ingredient5 = Ingredient.create!(name: 'Shallots', calories: 10)
      @ingredient6 = Ingredient.create!(name: 'Soft Boiled Egg', calories: 200)
      @ingredient7 = Ingredient.create!(name: 'Hot Chili Oil', calories: 10)
      @ingredient8 = Ingredient.create!(name: 'Mushrooms', calories: 75)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient4.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient5.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient6.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient7.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient8.id)

      @chef2 = Chef.create(name: 'Dad')
      @dish2 = Dish.create!(name: 'Cold Cereal', description: 'If you dont know what this is I cant help you.', chef_id: @chef1.id)
      @ingredient9 = Ingredient.create!(name: 'Cereal', calories: 190)
      @ingredient10 = Ingredient.create!(name: 'Milk', calories: 150)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient9.id)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient10.id)
    end

    it 'I see a link to view a list of all ingredients that this chef uses and see a link to a chefs ingredients index page' do
      visit chef_path(@chef1)

      expect(page).to have_content(@chef1.name.to_s)
      expect(page).to have_link("All Ingredients #{@chef1.name} Uses")

      click_link "All Ingredients #{@chef1.name} Uses"
      expect(current_path).to eq(chef_ingredients_path(@chef1))
    end
  end
end