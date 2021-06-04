class PlayersController < InheritedResources::Base
  # before_action :set_game, only: [:create]

  def create

    player = Player::CreateFromInvitationCode.run(invitation_code: player_params[:invitation_code], user_id: player_params[:user_id], color: player_params[:color])


      if player.success?
        @game = Game.where(id: player.result.game_id).first
        redirect_to @game
      else
        render :new, notice: player.errors.message
      end

  end

  private

    def player_params
      params.require(:player).permit(:color, :user_id, :game_id, :invitation_code)
    end

    def set_game
      @game = Game.find(params[:game_id])
    end


end
