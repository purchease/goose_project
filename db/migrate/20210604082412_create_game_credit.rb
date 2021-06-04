class CreateGameCredit < ActiveRecord::Migration[6.0]
  def change
    create_table :game_credits do |t|
      t.references :game, null: false, foreign_key: true
      t.boolean :is_used
    end
  end
end
