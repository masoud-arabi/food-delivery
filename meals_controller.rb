require_relative 'meals_view'
require_relative 'meal'

class MealsController
    def initialize(meal_repository)
        @meal_repository = meal_repository
        @view = MealsView.new
    end

    def add
        name = @view.ask_for(:name)
        price = @view.ask_for(:price).to_i
        meal = Meal.new(name: name, price: price)
        @meal_repository.create(meal)
    end

    def list
        meals = @meal_repository.all
        @view.display(meals)
    end
end