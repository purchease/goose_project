class Player::Move < Mutations::Command

  required do
    hash :fidmarques_uuid
    model :game
    model :player
  end

end
