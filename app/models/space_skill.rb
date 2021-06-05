class SpaceSkill < ApplicationRecord

  has_many :spaces

  TWO_TIMES = 'TWO_TIMES'
  MOVE_BACK_3_CASES = 'MOVE_BACK_3_CASES'
  GO_BACK_STARTING = 'GO_BACK_STARTING'
  FINISHED = 'FINISHED'
  BUMP_5_CASES = 'BUMP_5_CASES'

end