class Game::CreateAGame < Mutations::Command

  required do
    model :user
  end

  def validate
    add_error(:user, :game, 'A game already exists') if Game.where(user_id: user.id).where.not(status: "FINISHED").present?
    return
  end

  def execute
    create_a_game
  end

  def create_a_game
    @game = Game.create(user_id: user.id, invitation_code: SecureRandom.random_number(10000000), status: Game::WAITING)
    @game
  end

  # def create_the_board
  #   Board::Create.run!(game: @game)
  # end

end