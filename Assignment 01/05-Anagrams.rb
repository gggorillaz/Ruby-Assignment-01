def combine_anagrams(words)

	anagram = []

	words.each do |i|
		temp = []
		words.each do |j|
			if i.downcase.split(//).sort == j.downcase.split(//).sort	#check every word with every other word in the list (sorted of course)
				temp.push(j)						#words match, add to list
			end		
		end
		anagram.push(temp)
	end

	p anagram.uniq		#only want to print the output once for each array of strings, without uniq we print cars/racs/scar 3X
	
end

combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
