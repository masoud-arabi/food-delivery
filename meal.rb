class Meal
    attr_reader :id, :name, :price
    def initialize(attribute = {} )
        @id = attribute[:id]
        @name = attribute[:name]
        @price = attribute[:price]
    end


end

meal = Meal.new(id: 1, name:  "hndvfiv",price: 55)
p meal.id
p meal.name
p meal.price