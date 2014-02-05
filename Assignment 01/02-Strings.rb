def palindrome?(string)
	@string = string

	if @string.downcase.gsub(/\W+/, '') == @string.downcase.gsub(/\W+/ , '').reverse  #get rid of all punctuation and spaces then compare with the reverse of the string (palindrome)
											  #the /\W+/ is matching nonword characters and subbing them out
			puts true
		else
			puts false
	end
end

palindrome?("A man, a plan, a canal -- Panama")
palindrome?("Madam, I'm Adam!")
palindrome?("Abracadabra")
