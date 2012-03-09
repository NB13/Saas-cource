class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

$winnerTable = Hash[ "rs", 0, "sp", 0, "pr", 0 ]
$strategyPattern = /R|S|P|r|s|p/

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2	
	if game[0][1].match($strategyPattern).nil? || game[1][1].match($strategyPattern).nil?
		raise NoSuchStrategyError
	end
	if game[0][1].downcase.eql?(game[1][1].downcase ) 
		return game[0]
	else
		strategyCombination = game[0][1].downcase + game[1][1].downcase	
		result = $winnerTable[strategyCombination]
		if( result.nil? )
			return game[1 - $winnerTable[strategyCombination.reverse]]
		else
			return game[ result ]
		end
	end
end

def rps_tournament_winner(tournament)
	raise WrongNumberOfPlayersError unless tournament.length == 2
	if tournament[0][0].kind_of? String
		return rps_game_winner(tournament)
	else
		return rps_game_winner( [ rps_tournament_winner( tournament[0] ), rps_tournament_winner( tournament[1] ) ] )
	end
end

