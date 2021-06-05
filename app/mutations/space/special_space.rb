class Space::SpecialSpace < Mutations::Command

  required do
    integer :total
    model :space
  end

  def execute
    @total = total

    case space.space_skill.rule
    when SpaceSkill::TWO_TIMES
      @total = (total*2)
    when SpaceSkill::MOVE_BACK_3_CASES
      @total -= 3
    when SpaceSkill::GO_BACK_STARTING
      @total = 0
    when SpaceSkill::BUMP_5_CASES
      @total += 5
    else
      @total
    end
  end

end