class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players
  has_many :game_credits, as: :personable

  def current_game
    return if players.nil?
    all_games = players.map{|player| player.game.status}
    all_games.last == Game::FINISHED
    players.last.game
  end

  def current_player
    players.last if players.present?
  end

  def current_player_or_user
    if players.present?
      players.last
    else
      self
    end
  end
end
