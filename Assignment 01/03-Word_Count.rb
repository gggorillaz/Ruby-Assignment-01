def count_words(string)
	countHash = Hash.new(0)

	string.downcase.scan(/\w+/).each { |w| countHash[w] +=1 }  	#scan iterates through string for every word
									#at each entry it adds to that hash (a man, a plan ---> a(2x), man, plan)
	puts countHash
end

count_words("A man, a plan, a canal -- Panama")
count_words("Doo bee doo bee doo")
