module GamesHelper
  def invalid_move?(move, state)
      move.to_i.negative? || move.to_i > 8 || state[move.to_i] != "-"
  end
end