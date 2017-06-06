class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    case player1[1]
    when "S"
      if player2[1] == "S" || player2[1] == "P"
        return player1
      elsif player2[1] == "R"
        return player2
      else
        raise NoSuchStrategyError, "Strategy must be one of R,P,S", caller
      end
      
    when "P"
      if player2[1] == "P" || player2[1] == "R"
        return player1
      elsif player2[1] == "S"
        return player2
      else
        raise NoSuchStrategyError, "Strategy must be one of R,P,S", caller
      end
      
    when "R"
      if player2[1] == "R" || player2[1] == "S"
        return player1
      elsif player2[1] == "P"
        return player2
      else
        raise NoSuchStrategyError, "Strategy must be one of R,P,S", caller
      end
    end
  end

  def self.tournament_winner(tournament)
    
    if tournament[0].kind_of?(Array)
      first = tournament_winner(tournament[0])
      second = tournament_winner(tournament[1])
      winner = winner(first, second)
    else
      return tournament
    end
    winner
  end

end
