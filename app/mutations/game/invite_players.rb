class Game::InvitePlayers < Mutations::Command

  required do
    model :user
    model :game
  end

  def execute
    create_invitation_token
    send_email_to_user
  end

  def create_invitation_token

  end

  def send_email_to_user

  end
end
