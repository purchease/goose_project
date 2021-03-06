class GamesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_game, only: [:show, :start_a_game, :end_game]
  def show
    @player = Player.where(user: current_user, game: @game).first_or_initialize
    @board = @game.spaces.order(position: :asc)
    @players = @game.players
    @credits = GameCredit.where(game:@game, personable: current_user.current_player_or_user, is_used: nil).last if @players.present?
    @positions = @game.player_space_positions
    @finished = @positions.map{|position| position.space.position}.include?(63)
  end

  def create

    @game = Game::CreateAGame.run!(user: current_user)
    # game_current_user = Game.where(user_id: current_user.id).last
    if @game.present?
      redirect_to @game
    else
      redirect_to root_path
    end

  end

  def join
    @user = User.find(params)
  end

  def start_a_game
    Game::StartAGame.run!(game: @game)
    redirect_to @game
  end

  def end_game
    @game.update(status: Game::FINISHED)
    redirect_to root_path(uuid: current_user.fidmarques_uuid)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
