class Space::SpecialSpace < Mutations::Command

  required do
    integer :total
    model :space
  end

  def execute
    @total = total

    case space.space_skill.rule
    when Space::TWO_TIMES
      @total = (total*2)
    when Space::MOVE_BACK_3_CASES
      @total -= 3
    when Space::GO_BACK_STARTING
      hole
    when Space::BUMP_5_CASES
      5
    else
      @total
    end
  end

end