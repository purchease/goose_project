class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :game_credits, as: :personable, dependent: :delete_all
  has_many :player_space_positions, dependent: :delete_all

end
