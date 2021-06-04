class GameCredit < ApplicationRecord

  # has_many :spaces
  belongs_to :player
  belongs_to :game


end