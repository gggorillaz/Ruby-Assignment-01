#code sampled from https://docs.google.com/document/d/146gCqBlJZkalX0boNa38z7UagzVxvAw1fQGfvvnr6I8/edit?pli=1

def glob_match (filenames, pattern)
	pattern.gsub!(/[\*\?\.]/, '*' => '.*', '?' => '.',  '.' => '\.', )	#sub pattern with appropriate ., *, or ?. Here '*' '.' and '?' are all regexps
	filenames.select do |filename|
		filename =~ /#{pattern}/	# =~ returns the numerical index in the str where the pattern begins, pattern in this case is a regexp
						# in this case, we're matching a string with a regexp
	end
end

p glob_match(["part1.rb", "part2.rb", "part2.rb~", ".part3.rb.un~"],"*part*rb?*")
