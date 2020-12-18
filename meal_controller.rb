class MealController
    def initialize()
    end

    def add
        meal = @view.get_info
        meal = Meal.new(info[:id], info[:name], info[:price])
        @meal_repository.create(meal)
    end
end