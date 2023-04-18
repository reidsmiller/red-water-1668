require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
  end

  describe "relationships" do
    it { should belong_to :chef}
    it { should have_many :dish_ingredients}
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance_methods' do
    before(:each) do
      @chef1 = Chef.create!(name: 'Boyardee')
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

      @chef2 = Chef.create!(name: 'Guy Fiarri')
      @dish2 = Dish.create!(name: 'Cold Cereal', description: 'If you dont know what this is I cant help you.', chef_id: @chef2.id)
      @ingredient9 = Ingredient.create!(name: 'Cereal', calories: 190)
      @ingredient10 = Ingredient.create!(name: 'Milk', calories: 150)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient9.id)
      DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient10.id)
    end

    describe '#chef_name' do
      it 'can find the chef a dish belongs to' do
        expect(@dish1.chef_name).to eq('Boyardee')
        expect(@dish2.chef_name).to eq('Guy Fiarri')
      end
    end

    describe '#total_calories' do
      it 'can determine total calories for a dish' do
        expect(@dish1.total_calories).to eq(595)
        expect(@dish2.total_calories).to eq(340)
      end
    end
  end
end