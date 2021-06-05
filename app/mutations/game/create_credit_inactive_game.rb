class Game::CreateCreditInactiveGame < Mutations::Command

  required do
    model :user
  end

  def execute
    create_credit_to_user
  end

  def create_credit_to_user
    game_credit = GameCredit.where(personable: user, is_used: nil, game_id: nil).first_or_create
    game_credit.amount += 1
    game_credit.save!

  end

end