class Game::CreateAGame < Mutations::Command

  def execute
    create_a_game
    create_the_board
  end

  def create_a_game
    @game = Game.create(user_id: current_user.id)
  end

  def create_the_board
    Board::Create.run!(game: @game)
  end

end