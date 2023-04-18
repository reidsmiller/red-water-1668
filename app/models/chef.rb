class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def most_popular_ingredients
    ingredients
      .joins(:dishes)
      .group(:id)
      .select('ingredients.*, count(dishes.id) as dish_count')
      .order('dish_count DESC, ingredients.name')
      .limit(3)
  end
end