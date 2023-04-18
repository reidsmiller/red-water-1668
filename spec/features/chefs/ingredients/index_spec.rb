require 'rails_helper'

RSpec.describe 'chef_ingredients_path' do
  describe 'As a visitor, when I visit a chef ingredients index page' do
    before(:each) do
      @chef1 = Chef.create!(name: 'Reid')
      @chef2 = Chef.create!(name: 'Dad')
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

      @dish2 = Dish.create!(name: 'Cold Cereal', description: 'If you dont know what this is I cant help you.', chef_id: @chef1.id)
      @ingredient9 = Ingredient.create!(name: 'Cereal', calories: 190)
      @ingredient10 = Ingredient.create!(name: 'Milk', calories: 150)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient9.id)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient10.id)
      DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient10.id)

      @dish3 = Dish.create!(name: 'PB and J', description: 'If you dont know what this is I cant help you.', chef_id: @chef2.id)
      @ingredient11 = Ingredient.create!(name: 'Peanut Butter', calories: 190)
      @ingredient12 = Ingredient.create!(name: 'Jelly', calories: 150)
      @ingredient13 = Ingredient.create!(name: 'Bread', calories: 150)
    end

    it 'I see a unique list of names of all the ingredients that this chef uses' do
      visit chef_ingredients_path(@chef1)

      expect(page).to have_content("All Ingredients Used By Chef Reid")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content(@ingredient4.name)
      expect(page).to have_content(@ingredient5.name)
      expect(page).to have_content(@ingredient6.name)
      expect(page).to have_content(@ingredient7.name)
      expect(page).to have_content(@ingredient8.name)
      expect(page).to have_content(@ingredient9.name)
      expect(page).to have_content(@ingredient10.name)

      expect(page).to_not have_content(@ingredient11.name)
      expect(page).to_not have_content(@ingredient12.name)
      expect(page).to_not have_content(@ingredient13.name)

      visit chef_ingredients_path(@chef2)

      expect(page).to have_content("All Ingredients Used By Chef Dad")
      expect(page).to have_content(@ingredient11.name)
      expect(page).to have_content(@ingredient12.name)
      expect(page).to have_content(@ingredient13.name)

      expect(page).to_not have_content(@ingredient1.name)
      expect(page).to_not have_content(@ingredient2.name)
      expect(page).to_not have_content(@ingredient3.name)
      expect(page).to_not have_content(@ingredient4.name)
      expect(page).to_not have_content(@ingredient5.name)
      expect(page).to_not have_content(@ingredient6.name)
      expect(page).to_not have_content(@ingredient7.name)
      expect(page).to_not have_content(@ingredient8.name)
      expect(page).to_not have_content(@ingredient9.name)
      expect(page).to_not have_content(@ingredient10.name)
    end
  end
end