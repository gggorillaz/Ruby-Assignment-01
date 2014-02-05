class Numeric
	@@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}	#class variable

	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub( /s$/, '')	#match s at the end of the string and substitute for ''
		if @@currencies.has_key?(singular_currency)	#checks if hash actually has a value present for currency exchange
			self * @@currencies[singular_currency]
		else
			super
		end
	end

	def in(currency)
		singular_currency = currency.to_s.gsub(/s$/, '')
		self / @@currencies[singular_currency]		 #uses the numeric class and does conversion based on amount / amount2
	end

end

puts 10.dollars.in(:yen)	#dollars is defined in hash @@currencies
puts 10.dollars.in(:euros)
puts 704.yen.in(:euros)
