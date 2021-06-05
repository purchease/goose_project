class DicesController < ApplicationController
  before_action :set_game, only: [:rolls]
  before_action :set_credit, only: [:rolls]
  before_action :set_player, only: [:rolls]

  def rolls
    # Call pour avoir les dès
    dice_roll = Dice::Roll.run

    if dice_roll.success?
      dices = dice_roll.result
      player_move = Player::Move.run(dices: dices, game: @game, player: @player)

      if player_move.success?
        @game_credit.update(is_used: true)
        player_move_result = player_move.result
      end

      flash.now[:alert] = "Vous avez obtenu #{player_move_result[:dices]["dice_1"]} & #{player_move_result[:dices]["dice_2"]} vous avancez de la case #{player_move_result[:previous_space].position} à #{player_move_result[:new_space].position}"
      redirect_to @game
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