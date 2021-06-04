class PlayersController < InheritedResources::Base
  # before_action :set_game, only: [:create]
  before_action :authenticate_user!

  def new
  end

  def create

    player = Player::CreateFromInvitationCode.run(invitation_code: player_params[:invitation_code], user: current_user, color: player_params[:color])
    @game = Game.where(invitation_code: player_params[:invitation_code]).first

      if player.success?
        redirect_to @game
      else

        redirect_to @game, notice: "Essayez encore ! "
      end

  end

  private

    def player_params
      params.require(:player).permit(:color, :game_id, :invitation_code)
    end

    def set_game
      @game = Game.find(params[:game_id])
    end


end
