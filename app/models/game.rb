# app/models/game.rb
class Game < ApplicationRecord
  WINNING_CONDITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6]              # Diagonals
  ].freeze

  def game_finished?
    WINNING_CONDITIONS.each do |condition|
      values = condition.map { |position| state[position] }
      if values.uniq.length == 1 && values.first != "-"
        return true
      end
    end
    !state.include?("-")
  end

  def winner_symbol
    WINNING_CONDITIONS.each do |condition|
      values = condition.map { |position| state[position] }
      if values.uniq.length == 1 && values.first != "-"
        return values.first
      end
    end
    return "draw" if !state.include?("-")
    nil
  end
end
