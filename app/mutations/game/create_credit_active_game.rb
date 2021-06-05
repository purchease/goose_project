class Game::CreateCreditActiveGame < Mutations::Command

  required do
    string :fidmarques_uuid
  end

  def validate
    @user = User.where(fidmarques_uuid: fidmarques_uuid).first
    validate_game
    validate_players
  end

  def validate_game
    @game = @user.current_game
  end

  def validate_players
    @players = @game.players
  end

  def execute
    create_credit_to_all_users
  end

  def create_credit_to_all_users
    credit = []
    @players.each do |player|
      credit << GameCredit.where(game_id: @game.id, personable: player, is_used: 0)
    end
    return true if credit.count == @players.count
  end

end