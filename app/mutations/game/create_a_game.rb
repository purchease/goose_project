class Game::CreateAGame < Mutations::Command

  required do
    integer :user_id
  end

  def validate
    @user = User.find user_id
  end

  def execute
    create_a_game
    create_the_board
  end

  def create_a_game
    @game = Game.create(user_id: user_id)
  end

  def create_the_board
    Board::Create.run!(game: @game)
  end

end