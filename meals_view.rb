class MealsView
    def display(element)
        element.each_with_index do |element, index|
            puts "#{index + 1} #{element.name}"
        end
    end

    def ask_for(element)
        puts "what is the #{element}?"
        print ">"
        gets.chomp
    end
end