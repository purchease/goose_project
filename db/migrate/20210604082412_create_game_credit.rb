class CreateGameCredit < ActiveRecord::Migration[6.0]
  def change
    create_table :game_credits do |t|
      t.references :game, null: true, foreign_key: true
      t.references :personable, polymorphic: true, index: true
      t.boolean :is_used
      t.timestamps

    end

  end
end
