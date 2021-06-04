class Player::Create < Mutations::Command

  required do
    model :user
    model :game
    string :color
  end

  def execute
    create_a_player
  end

  def create_a_player
    @player = Player.create(user_id: user.id, game_id: game.id, color: color)
    @player
  end

  # Inside the view we need to allow the user to choose his color depending on the color that are pickable

end