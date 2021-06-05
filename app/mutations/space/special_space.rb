class Space::SpecialSpace < Mutations::Command

  required do
    integer :total
  end

  def execute
    @total = total
    case space.space_skill.rule
    when TWO_TIMES
      @total = (total*2)
    when MOVE_BACK_3_CASES
      @total -= 3
    when GO_BACK_STARTING
      hole
    when BUMP_5_CASES
      5
    else

    end
  end

end