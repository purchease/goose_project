class CreatePlayerSpace < ActiveRecord::Migration[6.0]
  def change
    create_table :player_spaces do |t|
      t.string :game_id
      t.string :player_id
    end
  end
end
