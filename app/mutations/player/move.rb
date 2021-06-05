class Player::Move < Mutations::Command

  required do
    hash :dices do
      integer :dice_1
      integer :dice_2
    end

    model :game
    model :player
  end

  def validate
    @player_space_position = PlayerSpacePosition.where(player:player, game: game).last
  end

  def previous_space
    @previous_space ||= @player_space_position.space
  end

  def execute
    move_the_player
    did_you_finished?
    result
  end

  def sum_the_dices
    @sum_the_dices ||= dices["dice_1"] + dices["dice_2"]
  end

  def move_the_player
    sum_the_dices
    update_the_new_space
    result
  end

  def update_the_new_space
    @psp = PlayerSpacePosition.where(player:player, game: game).last
    @psp.update(space: new_space)
  end

  def new_space
    return @new_space if defined?(@new_space)

    new_position = previous_space.position + @sum_the_dices
    @new_position = game.spaces.where(position: 63).first if new_space.position >= 63
    @new_position = game.spaces.where(position: new_position).first
  end

  def is_finished?
    @new_position.position == 63
  end

  def result
    {
      dices: dices,
      new_space: new_space,
      previous_space: previous_space,
      finished: is_finished?
    }
  end

end
