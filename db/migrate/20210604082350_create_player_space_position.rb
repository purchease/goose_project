class CreatePlayerSpacePosition < ActiveRecord::Migration[6.0]
  def change
    create_table :player_space_positions do |t|
      t.references :space, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.timestamps

    end
  end
end
