class GameCredit < ApplicationRecord

  # has_many :spaces
  belongs_to :personable, polymorphic: true
  belongs_to :game, optional: true


end