class Game::Join < Mutations::Command

  required do
    model :user
    model :game
  end

  def execute

  end


end