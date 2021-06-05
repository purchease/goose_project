class Game::CreateCreditInactiveGame < Mutations::Command

  required do
    model :user
  end

  def execute
    create_credit_to_user
  end

  def create_credit_to_user
    GameCredit.create!(personable: user, is_used: 0)
  end

end