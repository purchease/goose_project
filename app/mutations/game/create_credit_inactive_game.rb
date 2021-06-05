class Game::CreateCreditInactiveGame < Mutations::Command

  required do
    string :fidmarques_uuid
  end

  def validate
    @user = User.where(fidmarques_uuid: fidmarques_uuid).first
  end

  def execute
    create_credit_to_user
  end

  def create_credit_to_user
    GameCredit.create!(personable: @user, is_used: 0)
  end

end