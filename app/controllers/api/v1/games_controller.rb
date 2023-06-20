class Api::V1::GamesController < Api::V1::ApplicationController
  include GamesHelper

  def create
    game = Game.create(state: "---------")
    render json: game, status: :created
  end

  def update
    game = Game.find(params[:id])

    if game.game_finished? || invalid_move?(params[:move], game.state)
      render json: { message: "Invalid move" }, status: :unprocessable_entity
    else
      game.state[params[:move].to_i] = "X"

      if game.game_finished?
        game.update(state: game.state)
        render_winner(game)
      else
        computer_move(game)
      end
    end
  end

  private

  def computer_move(game)
    available_moves = game.state.each_char.with_index.select { |value, _| value == "-" }.map(&:last)
    random_move = available_moves.sample
    game.state[random_move] = "O"

    if game.game_finished?
      game.update(state: game.state)
      render_winner(game)
    else
      game.save
      render json: { message: nil, game: game }, status: :ok
    end
  end

  def render_winner(game)
    winner_symbol = game.winner_symbol

    if winner_symbol == "X"
      render json: { message: "You won the game!", game: game }, status: :ok
    elsif winner_symbol == "O"
      render json: { message: "Computer won the game!", game: game }, status: :ok
    elsif winner_symbol == "draw"
      render json: { message: "It's a draw!", game: game }, status: :ok
    else
      render json: { message: nil, game: game }, status: :ok
    end
  end
end
