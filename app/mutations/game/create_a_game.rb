class Game::CreateAGame < Mutations::Command

  required do
    model :user
  end

  def player
    @player ||= Player.where(user_id: user.id).last
  end

  def validate
    add_error(:user, :game, 'A game already exists') if !player.nil? && Game.where(user: player.user).last.status != "FINISHED".present?
  end

  def execute

    create_a_game if
    @game
  end

  def create_a_game
    @game = Game.create(user_id: user.id, invitation_code: SecureRandom.random_number(10000000), status: Game::WAITING)
  end

  # def create_the_board
  #   Board::Create.run!(game: @game)
  # end

end