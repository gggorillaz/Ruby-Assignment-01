# code taken from http://stackoverflow.com/questions/11352061/cartesian-product-ruby

class CartesianProduct
	
	include Enumerable

	def initialize(xs, ys)	#must initialize! rawwr! same thing as def xs= xs @xs=xs end etc... but waaay more succinct
		@xs = xs
		@ys = ys
	end

	def each
		return to_enum unless block_given?	#ensures were actually working with coordinates, not single points
		@xs.each do |x|
			@ys.each { |y| yield [x, y] }	#for every variation of x, yield every variation of y
		end
	end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
puts ''
c = CartesianProduct.new([:a,:b,:c], [8,6,5])
c.each { |elt| puts elt.inspect }

