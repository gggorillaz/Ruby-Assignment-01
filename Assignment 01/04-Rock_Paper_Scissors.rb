class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def player_winner(single_game)

	player1 = single_game[0][0]
	player2 = single_game[1][0]
	choice1 = single_game[0][1]
	choice2 = single_game[1][1]

        raise NoSuchStrategyError unless choice1 == "R" or choice1 == "P" or choice1 == "S"
        raise NoSuchStrategyError unless choice2 == "R" or choice2 == "P" or choice2 == "S"

	#tie game
	return [player1, choice1] if choice1 == choice2

        case choice1 + choice2
        #winning game
        when "RP"
                return [player2, choice2]
        when "RS"
                return [player1, choice1]
        when "PR"
                return [player1, choice1]
        when "PS"
                return [player2, choice2]
        when "SR"
                return [player2, choice2]
        when "SP"
                return [player1, choice1]
        end

end

#Code sampled from https://gist.github.com/manewitz/3886812

def rps_game_winner(game)
	
	raise WrongNumberOfPlayersError unless game.length == 2	

	if game.flatten.length == 4
		player_winner(game)
	elsif game.first.is_a?(Array)
		game = [ rps_game_winner(game[0]), rps_game_winner(game[1]) ]	#recursively goes from 8->4->2 players (16,8,4 lengths), game becomes the two winners of both brackets
		player_winner(game)						#we only reach this step with a total of 2 winners so recursion is no longer needed
	end
end

p rps_game_winner([["Armando", "P"],["Dave", "S"]])

p rps_game_winner([
		 [
		  [["Armando", "P"],["Dave", "S"]],
		  [["Richard", "R"],["Michael", "S"]],
		 ],
		 [
		  [["Allen", "S"],["Omer", "P"]],
		  [["David E.", "R"],["Richard X.", "P"]]
		 ]
		])

