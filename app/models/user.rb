class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players

  def current_game
    all_games = players.map{|player| player.game.status}
    all_games.last == Game::FINISHED
    players.last.game
  end

  def current_player
    players.last if players.present?
  end
end
