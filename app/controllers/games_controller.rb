class GamesController < ApplicationController
  before_action :set_game, only: [:show]
  def show
  end

  def create
    byebug
    Game::CreateAGame.run!(user_id: user.id)
  end

  def join
    @user = User.find(params)
  end


  private

  def set_game
    @game = Game.find(params[:id])
  end
end
