module ApplicationHelper

  def display_oie(color)
    if color == "VERT"
      'badge-success'
    elsif color == "ROUGE"
      'badge-danger'
    elsif color == "JAUNE"
      'badge-warning'
    else
      'badge-primary'
    end

  end

end
