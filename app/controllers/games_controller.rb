class GamesController < ApplicationController

  def create
    Game::CreateAGame.run!(user_id: user.id)
  end

  def join
    @user = User.find(params)
  end

end
