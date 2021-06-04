class GamesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_game, only: [:show]
  def show
    @player = Player.where(user: current_user, game: @game).first_or_initialize
    @board = @game.spaces.order(position: :asc)
    @players = @game.players
    @credits = GameCredit.where(game:@game, player_id: current_user.current_player, is_used: false) if @players.present?
  end

  def create
    @game = Game::CreateAGame.run(user: current_user)
    game_current_user = Game.where(user_id: current_user.id).last

    if game_current_user.present?
      redirect_to game_current_user
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
