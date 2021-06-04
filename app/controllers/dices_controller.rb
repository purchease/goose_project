class DicesController < ApplicationController
  before_action :set_game, only: [:rolls]
  before_action :set_credit, only: [:rolls]
  before_action :set_player, only: [:rolls]

  def rolls
    # Call pour avoir les dès
    Dice::Roll.run
    if Dice::Roll.success?
      dices = Dice::Roll.result
      Player::Move.run(dices: dices, game: @game, player: @player)
      if Player::Move.success?
        @game_credit.update(is_used: true)
      end
    end
  end

  private

  def set_credit
    @game_credit = GameCredit.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_player
    @player = Player.find(params[:id])
  end
end