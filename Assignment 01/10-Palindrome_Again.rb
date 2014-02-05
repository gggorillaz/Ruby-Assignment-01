class String	#just need to add palindrome to the string class
	def palindrome?
		if self.downcase.gsub(/\W+/, '') == self.downcase.gsub(/\W+/, '').reverse
				puts true
			else
				puts false
		end
	end
end

module Enumerable	#added palindrome to enumerable class
        def palindrome?
                if self.to_a.respond_to?(:reverse) and self.to_a == self.to_a.reverse	#a little different than string because we are working with arrays not strings now
                                puts true						#respond_to? just makes sure that it is reversable
                        else
                                puts false
                end
        end
end


puts "is \"palindrome\" a palindrome? : "
puts "palindrome".palindrome?
puts "is \"palilap\" a palindrome? : "
puts "palilap".palindrome?

puts "is \"\[1,2,3,2,1\]\" a palindrome? : "
puts [1, 2, 3, 2, 1].palindrome?

puts "is \"\[1,2,3,4,5\]\" a palindrome? : "
puts [1, 2, 3, 4, 5].palindrome?

