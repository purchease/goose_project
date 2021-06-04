module GameHelper

  def display_icon(space_skill_id)

    if space_skill_id == 1
      'fab fa-affiliatetheme'
    elsif space_skill_id == 2
      'fab fa-accusoft'
    elsif space_skill_id == 3
      'fas fa-adjust'
    elsif space_skill_id == 4
      'fas fa-align-center'
    else
      ''
    end
  end
end
