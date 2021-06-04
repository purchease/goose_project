class GamesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_game, only: [:show]
  def show
  end

  def create
    @game = Game::CreateAGame.run(user: current_user)

    if @game.success?
      redirect_to @game.result
    else
      redirect_to root_path
    end

  end

  def join
    @user = User.find(params)
  end


  private

  def set_game
    @game = Game.find(params[:id])
  end
end
