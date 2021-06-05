class Game::UpdateCreditWhenStartingAGame < Mutations::Command

  required do
    model :game
  end

  def players
    @players ||= game.players
  end

  def users
    @players.map(&:user)
  end

  def credits
    credits = []
    users.map do |user|
      credits << user.game_credits.where(is_used: 0, game_id: nil)
    end
    @credits ||= credits
  end

  def execute
    create_credit_to_user
  end

  def create_credit_to_user
    credits.each do |credit|
      credit.update(personable: credit.user.current_player, game_id: game.id)
      @players.each do |player|
        credit << GameCredit.where(game_id: game.id, personable: player, is_used: 0).first_or_create
      end
    end
    credit
  end

end