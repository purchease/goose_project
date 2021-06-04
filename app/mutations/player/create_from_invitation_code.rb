class Player::CreateFromInvitationCode < Mutations::Command

  required do
    string :invitation_code
    string :color
  end

  def validate
    validate_invitation
  end

  def validate_invitation
    @game = Game.where(invitation_code: invitation_code).first
    add_error(:games, 'Invitation code not found') if @game.nil?
  end

  def execute
    create_a_player
  end

  def create_a_player
    Player::Create.run!(game: @game, color: color)
  end

end