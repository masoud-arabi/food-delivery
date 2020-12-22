class Router
    def initialize(meals_controller)
      @meals_controller = meals_controller
      @running = true
    end
  
    def run
      while @running
        display_menu
        @choice = gets.chomp.to_i
        execute_action
      end
    end
  
    def display_menu
      puts "Here are your choices:"
      puts "1. Add a new meal"
      puts "2. List all meals"
      puts "3. Add a new customer"
      puts "4. List all customers"
      puts "0. To exit"
    end
  
    def execute_action
      case @choice
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 0 then @running = false
      else puts "Wrong choice 😕"
      end
    end
  end
  