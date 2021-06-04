class Player::CreateFromInvitationCode < Mutations::Command

  required do
    string :invitation_code
    integer :user_id
    string :color
  end

  def validate
    validate_invitation
    validate_user
  end

  def validate_invitation
    @game = Game.where(invitation_code: invitation_code).first
    add_error(:games, 'Invitation code not found') if @game.nil?
  end

  def validate_user
    @user = User.where(id: user_id).first
  end

  def execute
    create_a_player
  end

  def create_a_player
    Player::Create.run!(game: @game, user: @user, color: color)
  end

end