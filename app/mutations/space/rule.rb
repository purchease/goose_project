class Space::Rule < Mutations::Command

  optional do
    integer :space_id
  end

  def validate
    @space = Space.find space_id
  end

  def execute

    if @space.space_skill = two_times
      two_times
    elsif [5,9,14,18,23,27,32,36,41,45,50,54,59].include?(space_id)
      rip
    elsif [5,9,14,18,23,27,32,36,41,45,50,54,59].include?(space_id)
      hole
    elsif [5,9].include?(space_id)

    else

    end
  end

  # On va créer chaque méthode pour mettre les règles des cases
  #
  def two_times

  end

  def rip

  end

  def hole

  end

end