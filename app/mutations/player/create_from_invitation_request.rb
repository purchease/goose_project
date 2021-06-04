class Player::CreateFromInvitationRequest < Mutations::Command

  required do
    string :invitation_token
  end

  def validate
    validate_invitation
    validate_user
  end

  def validate_invitation
    @invitation = GameInvitation.find_by_invitation_token(invitation_token: invitation_token)
  end

  def validate_user
    @user = User.find_by_email(@invitation.email)
  end

  def execute
    create_a_player
  end

  def create_a_player
    player = Player::Create.run(game: @invitation.game, user: @user)
    if player.success?
      update_game_invitation_to_used
      player.result
    else
      player.errors
    end
  end

  def update_game_invitation_to_used
    @invitation.update(is_used: true)
  end



end