class Game::StartAGame < Mutations::Command

  required do
    model :game
  end

  def execute
    create_the_credits
    create_the_board
    update_the_status
    initialize_positions
    give_away_a_credit
    game
  end

  def create_the_credits
    Game::UpdateCreditWhenStartingAGame.run!(game: game) if users.present? && credits?
  end

  def users
    @users ||= players.map(&:user)
  end

  def players
    @players ||= game.players
  end

  def credits?
    credits = []
    users.map do |user|
      credits << user.game_credits.where(is_used: 0, game_id: nil)
    end
    credits.empty?
  end

  def create_the_board
    Board::Create.run!(game: game)
  end

  def update_the_status
    game.update(status: Game::RUNNING)
  end

  def space_initialize
    @space_initialize ||= game.spaces.where(position: 0).first
  end

  def initialize_positions
    players.each do |player|
      PlayerSpacePosition.create!(game: game, space: space_initialize, player: player)
    end
  end

  def give_away_a_credit
    Game::CreateCreditActiveGame.run!(user: @users.first)
  end

end