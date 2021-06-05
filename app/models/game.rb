class Game < ApplicationRecord
  AVAILABLE_COLORS = ['VERT', 'ROUGE', 'BLEU', 'JAUNE']
  WAITING = 'WAITING'
  RUNNING = 'RUNNING'
  FINISHED = 'FINISHED'

  has_many :players, dependent: :destroy
  has_many :spaces, dependent: :destroy
  has_many :game_credits, dependent: :destroy

  has_many :player_space_positions, dependent: :destroy


  def color_available
    AVAILABLE_COLORS - players.pluck(:color)
  end

end