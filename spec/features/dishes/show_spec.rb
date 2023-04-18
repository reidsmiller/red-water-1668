require 'rails_helper'

RSpec.describe 'dish_path', type: :feature do
  describe 'As a visitor, when I visit a dishes show page' do
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
      @dish2 = Dish.create!(name: 'Cold Cereal', description: 'If you dont know what this is I cant help you.', chef_id: @chef2.id)
      @ingredient9 = Ingredient.create!(name: 'Cereal', calories: 190)
      @ingredient10 = Ingredient.create!(name: 'Milk', calories: 150)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient9.id)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient10.id)
    end

    it 'I see a list of ingredients for that dish' do
      visit dish_path(@dish1)

      expect(page).to have_content("#{@dish1.name}")
      expect(page).to have_content('Ingredients:')
      expect(page).to have_content('Rice')
      expect(page).to have_content('Garlic')
      expect(page).to have_content('Chicken Broth')
      expect(page).to have_content('Ginger')
      expect(page).to have_content('Shallots')
      expect(page).to have_content('Soft Boiled Egg')
      expect(page).to have_content('Hot Chili Oil')
      expect(page).to have_content('Mushrooms')

      visit dish_path(@dish2)

      expect(page).to have_content("#{@dish2.name}")
      expect(page).to have_content('Ingredients:')
      expect(page).to have_content('Cereal')
      expect(page).to have_content('Milk')
    end

    it 'I see a total calorie count for that dish' do
      visit dish_path(@dish1)
      expect(page).to have_content('Total Calories: 595')

      visit dish_path(@dish2)
      expect(page).to have_content('Total Calories: 340')
    end

    it 'I see the chefs name' do
      visit dish_path(@dish1)
      expect(page).to have_content("Chef: #{@chef1.name}")

      visit dish_path(@dish2)
      expect(page).to have_content("Chef: #{@chef2.name}")
    end
  end
end