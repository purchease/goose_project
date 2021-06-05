class Game::CreateCreditActiveGame < Mutations::Command

  required do
    model :user
  end

  def validate
    validate_game
    validate_players
  end

  def validate_game
    @game = user.current_game
  end

  def validate_players
    @players = @game.players
  end

  def execute
    create_credit_to_all_users
  end

  def create_credit_to_all_users
    @players.each do |player|
        game_credit = GameCredit.where(game_id: @game.id, personable: player).first_or_create
        game_credit.amount += 1
        game_credit.save!
      end
  end

end