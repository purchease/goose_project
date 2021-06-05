class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :game_credits, as: :personable, dependent: :destroy
  has_many :player_space_positions, dependent: :destroy

end
