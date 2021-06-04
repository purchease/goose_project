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
    Player::Create.run!(game: @invitation.game, user: @user)
  end



end