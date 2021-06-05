class Game::StartAGame < Mutations::Command

  required do
    model :game
  end

  def execute
    create_the_credits
    create_the_board
    update_the_status
    initialize_positions
    game
  end

  def create_the_credits
    Game::UpdateCreditWhenStartingAGame.run!(game: game) if users.present? && credits?
  end

  def users
    game.players.map(&:user)
  end

  def credits?
    users.map do |user|
      user.game_credits.where(is_used: 0, game_id: nil)
    end
  end

  def create_the_board
    Board::Create.run!(game: game)
  end

  def update_the_status
    game.update(status: Game::RUNNING)
  end

  def initialize_positions
    game.players.each do |player|
      PlayerSpacePosition.create!(game: game, space_id: 0, player: player)
    end
  end

end