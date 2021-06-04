class CreatePlayer < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :color
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.timestamps

    end
  end
end
