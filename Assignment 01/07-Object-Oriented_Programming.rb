class Dessert
	attr_accessor :name, :calories

	def initialize (name, calories)
		@name = name
		@calories = calories
	end

	def healthy?
		if @calories < 200
			true
		else
			false
		end
	end

	def delicious?
		true
	end

end

class JellyBean < Dessert

	attr_accessor :flavor #setter for jellybean attributes

	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end

	def delicious?
		if (@flavor == "black licorice")
			false
		else
			true
		end
	end
end

cheese = Dessert.new("cheese", 199)
puts "#{cheese.name} is a dessert!"
puts "#{cheese.name} has #{cheese.calories} calories"
puts "is #{cheese.name} healthy? #{cheese.healthy?}. Is it delicious? #{cheese.delicious?}"

jelly1 = JellyBean.new("Black", 10, "black licorice")
jelly2 = JellyBean.new("Red", 10, "cherry")

puts "jelly1 is called #{jelly1.name}, has #{jelly1.calories} calories, and has flavor #{jelly1.flavor}"
puts "jelly1 is called #{jelly2.name}, has #{jelly2.calories} calories, and has flavor #{jelly2.flavor}"
puts "is jelly1 delicious? #{jelly1.delicious?}"
puts "is jelly2 delicious? #{jelly2.delicious?}"
