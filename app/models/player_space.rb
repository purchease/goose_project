class PlayerSpace < ApplicationRecord

  has_many :games
  has_many :players


end