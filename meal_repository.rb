require 'csv'
require_relative './meal'
class MealRepository
    def initialize(csv_file)
        @csv_file = csv_file
        @meals = []
        @next_id = 1
        load_csv if File.exist?(@csv_file)
    end

    def all
        @meals
    end

    def create(meal)
        meal.id = @next_id
        @next.id += 1
        @meals << meal
        store_csv
    end

    def find(id)
        @meals.find { |meal| meal.id == id }
    end

    def destroy(index_meal)
        @meals.delete_at(index_meal)
        store_csv
    end
    def load_csv
        csv_option = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_file, csv_option) do |row|
            row[:id] = row[:id].to_i
            row[:price] = row[:price].to_i
            @meals << Meal.new(row)
        end
        @next_id = @meals.empty? ? 1 : @meals.last.id + 1
    end

    def store_csv
        CSV.open(@csv_file, 'wb') do |row|
            row << ['id', 'name', 'price']
            @meals.each do |meal|
              row << [meal.id, meal.name, meal.price]
            end
          end
    end
end