class Space < ApplicationRecord

  belongs_to :space_skill
  has_many :player_space_positions, dependent: :destroy


end