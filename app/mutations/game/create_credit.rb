class Game::CreateCredit < Mutations::Command

  required do
    string :fidmarques_uuid
  end

  def validate
    @user = User.where(fidmarques_uuid: fidmarques_uuid).first
    @game = @user.current_game
    @players = @game.players
  end

  def execute
    create_credit_to_all_users
  end

  def create_credit_to_all_users
    credit = []
    @players.each do |player|
      credit << GameCredit.create!(game_id: @game.id, player_id: player.id, is_used: 0)
    end
    return true if credit.count == @players.count
  end

end