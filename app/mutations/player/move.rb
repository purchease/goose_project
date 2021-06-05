class Player::Move < Mutations::Command

  required do
    hash :dices do
      integer :dice_1
      integer :dice_2
    end

    model :game_id
    model :player_id
  end

  def validate
    @player_space_position = PlayerSpacePosition.where(player_id:player_id, game_id: game_id).last
  end

  def execute
    move_the_player
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
    @psp = PlayerSpacePosition.where(player_id:player_id, game_id: game_id).last
    @psp.update(position: new_position)
  end

  def new_position
    @new_position ||= @player_space_position.position + @sum_the_dices
  end

  def result
    {
      dices: dices,
      new_position: @psp.space.position
    }
    # La nouvelle position
    # Le nombre de dès
  end

end
