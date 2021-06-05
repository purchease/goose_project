module GameHelper

  def display_icon(space_skill_id)

    if space_skill_id == 1
      'square'
    elsif space_skill_id == 2
      'square_two_times'
    elsif space_skill_id == 3
      'square_move_back_3_cases'
    elsif space_skill_id == 4
      'square_hole'
    elsif space_skill_id == 5
      'square_bump'
    else
      'square'
    end
  end
end
