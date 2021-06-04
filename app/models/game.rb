class Game < ApplicationRecord
  AVAILABLE_COLORS = ['VERT', 'ROUGE', 'BLEU', 'JAUNE']
  WAITING = 'WAITING'
  RUNNING = 'RUNNING'
  FINISHED = 'FINISHED'

  has_many :players
  has_many :spaces

  def color_available
    AVAILABLE_COLORS - players.pluck(:color)
  end

end