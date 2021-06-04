class Dice::Roll < Mutations::Command

  def execute
    roll_the_dice
  end

  def roll_the_dice
    dice_1 = rand(1..6)
    dice_2 = rand(1..6)
    {
      dice_1: dice_1,
      dice_2: dice_2
    }
  end


end