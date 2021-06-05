class AddGameIdToPlayerSpacePosition < ActiveRecord::Migration[6.0]
  def change
    add_reference :player_space_positions, :game, null: false, foreign_key: true
  end
end
