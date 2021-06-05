class DicesController < ApplicationController
  before_action :set_game, only: [:rolls]
  before_action :set_credit, only: [:rolls]
  before_action :set_player, only: [:rolls]

  def rolls
    # Call pour avoir les dès
    dice_roll = Dice::Roll.run

    if dice_roll.success?
      dices = dice_roll.result
      byebug
      Player::Move.run(dices: dices, game: @game, player: @player)
      if Player::Move.success?
        @game_credit.update(is_used: true)
      end
    end
  end

  private

  def set_credit
    @game_credit = GameCredit.find(params[:credit])
  end

  def set_game
    @game = Game.find(params[:game])
  end

  def set_player
    @player = Player.find(params[:player])
  end
end